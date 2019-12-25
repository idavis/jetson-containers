import os
import io
import sys
import re
import pathlib
from plumbum import cli
from plumbum.cmd import rm
import json
import yaml
import logging
log = logging.getLogger()

deviceIds = [
    "P2888",
    "P2888-0060",
    "P3310",
    "P3489-0000",
    "P3489-0080",
    "P2180",
    "P3448-0000",
    "P3448-0020"
]

ignoredSections = [
    "NV_L4T_DATETIME_TARGET_SETUP_COMP",
    "NV_L4T_DEVICE_MODE_SETUP_COMP_IN_TARGET",
    "NV_L4T_DEVICE_MODE_SETUP_COMP_IN_FLASH",
    "NV_DEVICE_MODE_SETUP_IMAGE_COMP",
    "NV_DEVICE_MODE_SETUP_TARGET_COMP",
    "NV_DATETIME_SETUP_TARGET_COMP",
    "UBUNTU_BZIP2_PATCH_IN_TARGET",
    "UBUNTU_BZIP2_PATCH_IN_TARGET_IMAGE"
]

inactive_manifests = {
    # 4.2 is schema version 1.0
    "4.2": {"manifest": os.path.join(sys.path[0], "./manifests/sdkml3_jetpack_l4t_42.json")},

    # 4.2.1 rev 0 replaced by 4.2.1 rev 2
    "4.2.1": {"manifest": os.path.join(sys.path[0], "./manifests/sdkml3_jetpack_l4t_421.json")},

    # These have the right schema, but unless someone asks for it, I don't want to maintain them.
    "3.3.2": {"manifest": os.path.join(sys.path[0], "./manifests/sdkml3_jetpack_l4t_332.json")},
    "3.3.1": {"manifest": os.path.join(sys.path[0], "./manifests/sdkml3_jetpack_l4t_331.json")}
}

active_manifests = {
    "4.3": {
        "manifest": os.path.join(sys.path[0], "./manifests/sdkml3_jetpack_l4t_43_ga.json"),
        "additionalsdk": os.path.join(sys.path[0], "./manifests/sdkml3_jetpack_l4t_43_ga_deepstream.json")
    },

    "4.2.3": {"manifest": os.path.join(sys.path[0], "./manifests/sdkml3_jetpack_l4t_423.json")},
    "4.2.2": {"manifest": os.path.join(sys.path[0], "./manifests/sdkml3_jetpack_l4t_422_rev1_b30.json")},
    "4.2.1": {"manifest": os.path.join(sys.path[0], "./manifests/sdkml3_jetpack_l4t_421_b107_rev2.json")},
}


class ManifestProcessor(cli.Application):
    PROGNAME = "Jetson Containers Manifest Processor"
    VERSION = "1.0"

    @cli.switch("--verbose")
    def verbose(self):
        logging.root.setLevel(logging.DEBUG)

    def main(self):
        for jetpack_version in active_manifests.keys():
            log.info(f"Processing JetPack {jetpack_version}")
            current_jetpack = active_manifests[jetpack_version]
            datastore = self.open_json_file(current_jetpack["manifest"])

            #jetpack_version = datastore["information"]["release"]["releaseVersion"]
            self.prepare_output_path(jetpack_version)

            self.validate_manifest_schema(datastore)

            self.load_additional_sdks(datastore, current_jetpack)

            self.build_l4t_context(datastore)

            self.build_jetpack_context(datastore)

    def prepare_output_path(self, jetpack_version):
        output_path = pathlib.Path(f"dist/{jetpack_version}")
        if output_path.exists:
            log.debug(f"Removing {output_path}")
            rm["-rf", output_path]()
        log.debug(f"Creating {output_path}")
        output_path.mkdir(parents=True, exist_ok=False)
        self.output_path = output_path

    def build_l4t_context(self, datastore):
        sections = datastore["sections"]
        _, flash_section = self.find_section(sections, "NV_FLASH_SECTION")

        context = {}

        self.build_component_definitions(
            context, datastore, flash_section, None)

        self.write_yml_dictionary("l4t.yml", context)

    def build_jetpack_context(self, datastore):
        sections = datastore["sections"]
        _, postflash_section = self.find_section(
            sections, "NV_POSTFLASH_SECTION")

        context = {}

        self.build_component_definitions(
            context, datastore, postflash_section, None)

        found, additionalsdks_section = self.find_section(
            sections, "NV_ADDTIONAL_SDKS_SECTION")

        if(found):
            self.build_component_definitions(context, datastore,
                                             additionalsdks_section, None)

        self.write_yml_dictionary("jetpack.yml", context)

    def open_json_file(self, filepath):
        with open(filepath, 'r') as f:
            datastore = json.load(f)
            return datastore

    def write_yml_dictionary(self, filename, context):
        filepath = os.path.join(self.output_path, filename)
        with open(filepath, 'w') as outfile:
            yaml.dump(context, outfile, default_flow_style=False)

    def find_section(self, sections, section_name):
        for section in sections:
            if(section["id"] == section_name):
                return True, section
        return False, None

    def validate_manifest_schema(self, datastore):
        if datastore["information"]["schemaVersion"] == "1.0":
            raise Exception(
                "Version 1.0 schemas are not implemented (such as JetPack 4.2)")

        sections = datastore["sections"]

        # In case Nvidia introduces something new.
        for section in sections:
            if(section["id"] not in ["NV_HOST_SECTION", "NV_FLASH_SECTION", "NV_POSTFLASH_SECTION", "NV_ADDTIONAL_SDKS_SECTION"]):
                raise Exception('Unexpected section', section["id"])

    def load_additional_sdks(self, datastore, current_jetpack):
        if "additionalsdk" not in current_jetpack:
            return

        filepath = current_jetpack["additionalsdk"]
        sdk = self.open_json_file(filepath)

        groups = sdk["groups"]
        for key in groups.keys():
            group = groups[key]
            id = group["id"]
            datastore["groups"][id] = groups[key]

        components = sdk["components"]
        for key in components.keys():
            component = components[key]
            id = component["id"]
            datastore["components"][id] = components[key]

    def get_components_for_device(self, datastore, section, targetDevice, operatingSystem):
        component_versions = self.get_components_to_use(
            datastore, section, targetDevice, operatingSystem)
        component_names = set()
        for component_version in component_versions:
            if component_version[0] not in component_names:
                component_names.add(component_version[0])
                yield component_version

    def get_components_to_use(self, datastore, section, targetDevice, operatingSystem):
        selectedGroups = section["groups"]
        components = self.get_components(datastore, section, selectedGroups)
        for component in components:
            versions = self.get_compatible_versions(
                datastore, component, targetDevice, operatingSystem)
            for version in versions:
                if "version" in version:
                    yield (component["id"], version)
                    for dependency in version["dependencies"]:
                        # Dependencies can be device ids in which the normal dependency is nested
                        if dependency in deviceIds:
                            # if not this device, skip
                            if dependency != targetDevice:
                                continue
                            # unwrap the nested dependency
                            dependency = version["dependencies"][dependency][0]
                        compatible_dependencies = self.get_compatible_dependency(
                            datastore, dependency, targetDevice, operatingSystem)
                        for compatible_dependency in compatible_dependencies:
                            yield (dependency["id"], compatible_dependency)

    def get_compatible_dependency(self, datastore, dependency, targetDevice, operatingSystem):
        components = datastore["components"]
        component = components[dependency["id"]]
        for version in component["versions"]:
            if operatingSystem is None or operatingSystem in version["operatingSystems"]:
                if dependency["operator"] == "==" and version["version"] == dependency["ver"]:
                    if targetDevice is None or targetDevice in version["targetIds"]:
                        yield version

    def get_compatible_versions(self, datastore, component, targetDevice, operatingSystem):
        for version in datastore["components"][component["id"]]["versions"]:
            if operatingSystem is None or operatingSystem in version["operatingSystems"]:
                if targetDevice is None or targetDevice in version["targetIds"]:
                    yield version

    def get_components(self, datastore, section, selectedGroups):
        for selectedGroup in selectedGroups:
            if selectedGroup in datastore["groups"]:
                group = datastore["groups"][selectedGroup]
            else:
                log.error(f"Group missing from manifest {selectedGroup}")
                continue

            for version in group["versions"]:
                components = version["components"]
                for component in components:
                    yield component

    def build_component_definitions(self, context, datastore, section, operatingSystem):
        targetHW = datastore["information"]["release"]["targetHW"]
        for targetDevice in targetHW:
            if targetDevice not in context:
                context[targetDevice] = {}
            for cv in self.get_components_for_device(datastore, section, targetDevice, operatingSystem):

                componentName = self.get_component_name(cv[0])
                if componentName is None:
                    continue

                componentContext = {}

                context[targetDevice][componentName] = componentContext
                for file in cv[1]["downloadFiles"]:
                    fileContext = {}
                    if componentName == "drivers" or componentName == "rootfs":
                        fileContext = componentContext
                    
                    fileContext["component"] = cv[0]
                    fileContext["version"] = cv[1]["version"]
                    fileContext["fileName"] = file["fileName"]
                    fileContext["checksum"] = file["checksum"]
                    fileContext["checksumType"] = file["checksumType"]
                    if "packagesInfo" in file["installParameters"]["additionalParameters"]:
                        fileContext["packageVersion"] = file["installParameters"]["additionalParameters"]["packagesInfo"][0]["version"]
                        fileContext["packageName"] = file["installParameters"]["additionalParameters"]["packagesInfo"][0]["name"]

                    if componentName == "drivers" or componentName == "rootfs":
                        if fileContext["version"] == "32.2.01" or fileContext["version"] == "32.2":
                            if "32.2.1" in fileContext["fileName"] :
                                fileContext["version"] = "32.2.1"
                        if fileContext["version"] == "32.2.01" or fileContext["version"] == "32.2":
                            if "32.2.0" in fileContext["fileName"]:
                                fileContext["version"] = "32.2.0"
                        if fileContext["version"] == "32.3":
                            if "32.3.1" in fileContext["fileName"]:
                                fileContext["version"] = "32.3.1"
   
                    componentFileName = fileContext["fileName"]
                    if "packageName" in fileContext:
                        componentFileName = fileContext["packageName"]
                    if componentContext is not fileContext:
                        componentContext[componentFileName] = fileContext

                    if componentName == "cuda":
                        p = re.compile("cuda-repo-l4t-10-0-local-(\d+\.\d+\.\d+)_1.0-1_arm64.deb")
                        result = p.search(fileContext["fileName"])
                        version = result.group(1)
                        fileContext["version"] = version

    def get_component_name(self, componentName):
        if componentName in ignoredSections:
            return None
        if componentName.startswith("NV_L4T_FLASH_") and componentName.endswith("_WITH_OS_IMAGE_COMP"):
            return None
        if componentName == ("NV_L4T_VISIONWORKS_TARGET_POST_INSTALL_COMP"):
            componentName = "visionworks"
        elif componentName.startswith("NV_MULTIMEDIA_API_TARGET_POST_INSTALL"):
            componentName = "multimedia_api"
        elif componentName == "NV_DOCKER_TARGET_POST_INSTALL_COMP":
            componentName = "nvdocker"
        elif componentName == "NV_L4T_CUDA_TARGET_POST_INSTALL_COMP":
            componentName = "cuda"
        elif componentName.startswith("NV_L4T_CUDNN_TARGET_POST_INSTALL"):
            componentName = "cudnn"
        elif componentName.startswith("NV_L4T_TENSORRT_TARGET_POST_INSTALL"):
            componentName = "tensorrt"
        elif componentName == "NV_L4T_OPENCV_TARGET_POST_INSTALL_COMP":
            componentName = "opencv"
        elif componentName.startswith("NV_L4T_FILE_SYSTEM_AND_OS"):
            componentName = "rootfs"
        elif componentName.startswith("NV_L4T_DRIVERS"):
            componentName = "drivers"
        elif componentName.startswith("NV_DEEPSTREAM_TARGET_POST_INSTALL"):
            componentName = "deepstream"
        elif componentName == "NV_L4T_TENSORRT_DLA_TARGET_POST_INSTALL_COMP":
            componentName = "deepstreamdla"
        elif componentName == "NV_VPI_TARGET_POST_INSTALL_COMP":
            componentName = "vpi"
        elif componentName.startswith("NV_TENSORFLOW_TARGET_POST_INSTALL_COMP"):
            componentName = "tensorflow"
        elif componentName.startswith("NV_L4T_TENSORRT_NODLA_TARGET_POST_INSTALL_COMP"):
            componentName = "tensorflownodla"
        elif componentName.startswith("NV_L4T_OPENCV_TARGET_POST_INSTALL"):
            # almost redundant of above, but ends with the device id
            # they kept the same schema version but introduced new nodes for the same use
            componentName = "opencv"
        else:
            raise Exception('Unexpected component', componentName)
        return componentName


if __name__ == "__main__":
    ManifestProcessor.run()
