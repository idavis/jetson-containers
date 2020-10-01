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

v4deviceIdToPartNameDeviceIdLookup = {
    "JETSON_AGX_XAVIER": "P2888-0001",
    "JETSON_AGX_XAVIER_32GB": "P2888-0004",
    "JETSON_AGX_XAVIER_8GB": "P2888-0006",
    "JETSON_XAVIER_NX_DEVKIT": "P3668-0000",
    "JETSON_XAVIER_NX": "P3668-0001",
    "JETSON_TX2": "P3310-1000",
    "JETSON_TX2_4GB": "P3489-0888",
    "JETSON_TX2I": "P3489-0000",
    "JETSON_TX1": "P2180-1000",
    "JETSON_NANO_DEVKIT": "P3448-0000",
    "JETSON_NANO": "P3448-0002"
}

deviceIdToCurrentIdLookup = {
    "P2888": "P2888-0001",
    "P2888-0001": "P2888-0001",
    "P2888-0004": "P2888-0004",
    "P2888-0060": "P2888-0006",
    "P2888-0006": "P2888-0006",
    "P3668-0000": "P3668-0000",
    "P3668-0001": "P3668-0001",
    "P3310": "P3310-1000",
    "P3310-1000": "P3310-1000",
    "P3489-0000": "P3489-0000",
    "P3489-0080": "P3489-0888",
    "P3489-0888": "P3489-0888",
    "P2180": "P2180-1000",
    "P2180-1000": "P2180-1000",
    "P3448-0000": "P3448-0000",
    "P3448-0002": "P3448-0002",
    "P3448-0020": "P3448-0002"
}

deviceIds = [
    "P2888",
    "P2888-0001",
    "P2888-0004",
    "P2888-0060",
    "P2888-0006",
    "P3668-0000",
    "P3668-0001",
    "P3310",
    "P3310-1000",
    "P3489-0000",
    "P3489-0080",
    "P3489-0888",
    "P2180",
    "P2180-1000",
    "P3448-0000",
    "P3448-0002",
    "P3448-0020",
]

def get_current_device_id(device):
    if device in v4deviceIdToPartNameDeviceIdLookup:
        return v4deviceIdToPartNameDeviceIdLookup[device]
    if device in deviceIdToCurrentIdLookup:
        return deviceIdToCurrentIdLookup[device]
    raise Exception('Unexpected device', device)

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
    # 4.2.2 rev 1 replaced by 4.2.2 rev 1 b30
    "4.2.2": {"manifest": os.path.join(sys.path[0], "./manifests/sdkml3_jetpack_l4t_422_rev1.json")},

    # 4.2.1 b103 rev 2 replaced by 4.2.1 b107 rev2
    "4.2.1": {"manifest": os.path.join(sys.path[0], "./manifests/sdkml3_jetpack_l4t_421_b103_rev2.json")},
    # 4.2.1 rev 0 replaced by 4.2.1 b103 rev 2
    "4.2.1": {"manifest": os.path.join(sys.path[0], "./manifests/sdkml3_jetpack_l4t_421.json")},

    # These have the right schema, but unless someone asks for it, I don't want to maintain them.
    "3.3.2": {"manifest": os.path.join(sys.path[0], "./manifests/sdkml3_jetpack_l4t_332.json")},
    "3.3.1": {"manifest": os.path.join(sys.path[0], "./manifests/sdkml3_jetpack_l4t_331.json")}
}

active_manifests = {
    "4.4": {
        "manifest": os.path.join(sys.path[0], "./manifests/sdkml3_jetpack_l4t_44_ga.json"),
        "additionalsdk": os.path.join(sys.path[0], "./manifests/sdkml3_jetpack_l4t_44_ga_deepstream.json")
    },

    "4.3": {
        "manifest": os.path.join(sys.path[0], "./manifests/sdkml3_jetpack_l4t_43_ga.json"),
        "additionalsdk": os.path.join(sys.path[0], "./manifests/sdkml3_jetpack_l4t_43_ga_deepstream.json")
    },

    "4.2.3": {"manifest": os.path.join(sys.path[0], "./manifests/sdkml3_jetpack_l4t_423.json")},
    "4.2.2": {"manifest": os.path.join(sys.path[0], "./manifests/sdkml3_jetpack_l4t_422_rev1_b30.json")},
    "4.2.1": {"manifest": os.path.join(sys.path[0], "./manifests/sdkml3_jetpack_l4t_421_b107_rev2.json")},
    "4.2": {"manifest": os.path.join(sys.path[0], "./manifests/sdkml3_jetpack_l4t_42.json")}
}

cuda_matcher = re.compile(
    "cuda-repo-l4t-10-\d-local-(\d+\.\d+\.\d+)_1.0-1_arm64.deb")
cudnn_name_matcher = re.compile(
    "(libcudnn7-*[a-zA-Z]*)_(?:\d+\.\d+\.\d+\.*\d*)-1\+cuda10.\d_arm64.deb")
libvisionworks_name_matcher = re.compile(
    "(libvisionworks(?:(?:[a-zA-Z-]*)))-repo_(?:\d+\.\d+\.\d+\.*\d*)(?:[a-zA-Z-]*)_arm64.deb")
cudnn_version_matcher = re.compile(
    "libcudnn7-*[a-zA-Z]*_(\d+\.\d+\.\d+\.*\d*)-1\+cuda10.\d_arm64.deb")
libnvinfer_name_matcher = re.compile(
    "(tensorrt|graphsurgeon-tf|uff-converter-tf|libnvinfer(?:[\d_]*|-(?:(?:[a-zA-Z-]*))))_(?:\d+\.\d+\.\d+\.*\d*)(?:[a-zA-Z-]*)-1\+cuda10.\d_(?:arm64|all).deb")
libnvinfer_matcher = re.compile(
    "(?:tensorrt|graphsurgeon-tf|uff-converter-tf|libnvinfer[0-9]*)-*[a-zA-Z]*_(\d+\.\d+\.\d+\.*\d*)-1\+cuda10.\d_(?:all|arm64).deb")
libopencv_name_matcher = re.compile(
    "(libopencv(?:(?:[a-zA-Z-]*)))_(?:\d+\.\d+\.\d+\.*\d*)-(?:[a-zA-Z0-9-]+)_arm64.deb")


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

            if datastore["information"]["schemaVersion"] == "1.0":
                ManifestProcessorV1().main(datastore, jetpack_version, current_jetpack)
            elif datastore["information"]["schemaVersion"] == "2.0":
                ManifestProcessorV2().main(datastore, jetpack_version, current_jetpack)
            else:
                ManifestProcessorV4().main(datastore, jetpack_version, current_jetpack)

    def open_json_file(self, filepath):
        with open(filepath, 'r') as f:
            datastore = json.load(f)
            return datastore


class ManifestProcessorBase():
    def prepare_output_path(self, jetpack_version):
        output_path = pathlib.Path(f"dist/{jetpack_version}")
        if output_path.exists:
            log.debug(f"Removing {output_path}")
            rm["-rf", output_path]()
        log.debug(f"Creating {output_path}")
        output_path.mkdir(parents=True, exist_ok=False)
        self.output_path = output_path

    def open_json_file(self, filepath):
        with open(filepath, 'r') as f:
            datastore = json.load(f)
            return datastore

    def write_yml_dictionary(self, filename, context):
        filepath = os.path.join(self.output_path, filename)
        adjusted = {}
        for key, val in context.items():
            key = get_current_device_id(key)
            adjusted[key] = val
        with open(filepath, 'w') as outfile:
            yaml.dump(adjusted, outfile, default_flow_style=False)

    def get_components_for_device(self, datastore, selectedGroups, targetDevice, operatingSystem):
        component_versions = self.get_components_to_use(
            datastore, selectedGroups, targetDevice, operatingSystem)
        component_names = set()
        for component_version in component_versions:
            if component_version[0] not in component_names:
                component_names.add(component_version[0])
                yield component_version

    def get_components_to_use(self, datastore, selectedGroups, targetDevice, operatingSystem):
        components = self.get_components(datastore, selectedGroups)
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

    def get_components(self, datastore, selectedGroups):
        for selectedGroup in selectedGroups:
            if selectedGroup in datastore["groups"]:
                group = datastore["groups"][selectedGroup]
            else:
                log.error(f"Group missing from manifest {selectedGroup}")
                continue

            for version in group["versions"]:
                components = version["components"]
                for component in components:
                    componentName = self.get_component_name(component["id"])
                    if componentName is None:
                        continue
                    yield component

    def build_component_definitions(self, context, datastore, selectedGroups, operatingSystem):
        targetHW = datastore["information"]["release"]["targetHW"]
        for targetDevice in targetHW:
            if targetDevice not in context:
                context[targetDevice] = {}
            for cv in self.get_components_for_device(datastore, selectedGroups, targetDevice, operatingSystem):

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
                            if "32.2.1" in fileContext["fileName"]:
                                fileContext["version"] = "32.2.1"
                        if fileContext["version"] == "32.2.01" or fileContext["version"] == "32.2":
                            if "32.2.0" in fileContext["fileName"]:
                                fileContext["version"] = "32.2.0"
                        if fileContext["version"] == "32.3":
                            if "32.3.1" in fileContext["fileName"]:
                                fileContext["version"] = "32.3.1"
                        if fileContext["version"] == "32.4":
                            if "32.4.3" in fileContext["fileName"]:
                                fileContext["version"] = "32.4.3"
                    componentFileName = self.get_component_file_name(
                        componentName,
                        fileContext)

                    if componentContext is not fileContext:
                        componentContext[componentFileName] = fileContext

                    if componentName == "cuda":
                        result = cuda_matcher.search(fileContext["fileName"])
                        version = result.group(1)
                        fileContext["version"] = version
                    elif componentName == "cudnn":
                        fname = fileContext["fileName"]
                        if "packageName" in fileContext:
                            if fileContext["packageName"].startswith("libcudnn7"):
                                fname = fileContext["fileName"]
                        result = cudnn_version_matcher.search(fname)
                        if result is not None:
                            version = result.group(1)
                            fileContext["version"] = version

                    elif componentName == "tensorrt":
                        result = libnvinfer_matcher.search(
                            fileContext["fileName"])
                        if result is not None:
                            version = result.group(1)
                            fileContext["version"] = version
                    elif componentName == "deepstreamdla" or componentName == "tensorflownodla":
                        result = libnvinfer_matcher.search(
                            fileContext["fileName"])
                        if result is not None:
                            version = result.group(1)
                            fileContext["version"] = version

    def get_component_file_name(self, componentName, fileContext):
        componentFileName = fileContext["fileName"]
        return componentFileName

    def get_component_name(self, componentName):
        if componentName in ignoredSections:
            return None
        if componentName.startswith("NV_L4T_FLASH_") and componentName.endswith("_WITH_OS_IMAGE_COMP"):
            return None
        if componentName == ("NV_L4T_VISIONWORKS_TARGET_POST_INSTALL_COMP"):
            componentName = "visionworks"
        elif componentName.startswith("NV_MULTIMEDIA_API_TARGET_POST_INSTALL") or componentName.startswith("NV_L4T_MULTIMEDIA_API_TARGET_POST_INSTALL"):
            componentName = "multimedia_api"
        elif componentName == "NV_DOCKER_TARGET_POST_INSTALL_COMP" or componentName == "NV_L4T_DOCKER_TARGET_POST_INSTALL_COMP":
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
        elif componentName == "NV_VPI_TARGET_POST_INSTALL_COMP" or componentName == "NV_L4T_VPI_TARGET_POST_INSTALL_COMP":
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


class ManifestProcessorV1(ManifestProcessorBase):
    def main(self, datastore, jetpack_version, current_jetpack):
        log.info(f"Processing JetPack {jetpack_version}")
        self.prepare_output_path(jetpack_version)

        self.prepare_output_path(jetpack_version)

        self.validate_manifest_schema(datastore)

        self.build_l4t_context(datastore)

        self.build_jetpack_context(datastore)

    def build_l4t_context(self, datastore):
        context = {}

        self.build_component_definitions(
            context, datastore, ['NV_JETPACK_L4T_IMAGE_SETUP_TARGET_GROUP'], None)
        self.write_yml_dictionary("l4t.yml", context)

    def build_jetpack_context(self, datastore):
        context = {}
        postflash_sections = ["NV_ADDITIONAL_SETUP_TARGET_GROUP",
                              "NV_CUDA_TARGET_GROUP",
                              "NV_AI_TARGET_GROUP",
                              "NV_COMPUTERVISION_TARGET_GROUP",
                              "NV_DOCKER_TARGET_GROUP",
                              "NV_MULTIMEDIA_API_TARGET_GROUP"]
        self.build_component_definitions(
            context, datastore, postflash_sections, None)

        self.write_yml_dictionary("jetpack.yml", context)

    def find_section(self, sections, section_name):
        for section in sections:
            if(section["id"] == section_name):
                return True, section
        return False, None

    def validate_manifest_schema(self, datastore):
        if datastore["information"]["schemaVersion"] != "1.0":
            raise Exception(
                "Version 1.0 schemas expected")

    def get_component_file_name(self, componentName, fileContext):
        componentFileName = fileContext["fileName"]
        if "packageName" in fileContext:
            componentFileName = fileContext["packageName"]
            if componentFileName == "cuda-toolkit-10-0":
                componentFileName = "toolkit"
        if componentName == "cuda":
            componentFileName = fileContext["component"]
            if componentFileName == "NV_L4T_CUDA_TARGET_POST_INSTALL_COMP":
                componentFileName = "toolkit"
        if componentName == "cudnn":
            fname = fileContext["fileName"]
            result = cudnn_name_matcher.search(fname)
            if result is not None:
                name = result.group(1)
                componentFileName = name
        if componentName == "visionworks":
            fname = fileContext["fileName"]
            result = libvisionworks_name_matcher.search(fname)
            if result is not None:
                name = result.group(1)
                componentFileName = name
        if componentName == "tensorrt":
            fname = fileContext["fileName"]
            result = libnvinfer_name_matcher.search(fname)
            if result is not None:
                name = result.group(1)
                componentFileName = name
        if componentName == "opencv":
            fname = fileContext["fileName"]
            result = libopencv_name_matcher.search(fname)
            if result is not None:
                name = result.group(1)
                componentFileName = name
        return componentFileName


class ManifestProcessorV2(ManifestProcessorBase):
    def main(self, datastore, jetpack_version, current_jetpack):
        log.info(f"Processing JetPack {jetpack_version}")
        self.prepare_output_path(jetpack_version)

        self.prepare_output_path(jetpack_version)

        self.validate_manifest_schema(datastore)

        self.load_additional_sdks(datastore, current_jetpack)

        self.build_l4t_context(datastore)

        self.build_jetpack_context(datastore)

    def build_l4t_context(self, datastore):
        sections = datastore["sections"]
        _, flash_section = self.find_section(sections, "NV_FLASH_SECTION")

        context = {}

        self.build_component_definitions(
            context, datastore, flash_section["groups"], None)

        self.write_yml_dictionary("l4t.yml", context)

    def build_jetpack_context(self, datastore):
        sections = datastore["sections"]
        _, postflash_section = self.find_section(
            sections, "NV_POSTFLASH_SECTION")

        context = {}

        self.build_component_definitions(
            context, datastore, postflash_section["groups"], None)

        found, additionalsdks_section = self.find_section(
            sections, "NV_ADDTIONAL_SDKS_SECTION")

        if(found):
            self.build_component_definitions(context, datastore,
                                             additionalsdks_section["groups"], None)

        self.write_yml_dictionary("jetpack.yml", context)

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

    def get_component_file_name(self, componentName, fileContext):
        componentFileName = fileContext["fileName"]
        if "packageName" in fileContext:
            componentFileName = fileContext["packageName"]
            if componentFileName == "cuda-toolkit-10-0":
                componentFileName = "toolkit"

        return componentFileName

class ManifestProcessorV4(ManifestProcessorV2):
    def main(self, datastore, jetpack_version, current_jetpack):
        log.info(f"Processing JetPack {jetpack_version}")
        self.prepare_output_path(jetpack_version)

        self.prepare_output_path(jetpack_version)

        self.validate_manifest_schema(datastore)

        self.load_additional_sdks(datastore, current_jetpack)

        self.build_l4t_context(datastore)

        self.build_jetpack_context(datastore)
    
    def validate_manifest_schema(self, datastore):
        if datastore["information"]["schemaVersion"] != "4.0":
            raise Exception(
                "Version 4.0 schema required")
        groups = {}
        values = datastore["groups"][1::2]
        keys = datastore["groups"][::2]
        for idx, val in enumerate(keys):
            groups[val] = values[idx]
        datastore["groups"] = groups
        sections = datastore["sections"]

        # In case Nvidia introduces something new.
        for section in sections:
            if(section["id"] not in ["NV_HOST_SECTION", "NV_FLASH_SECTION", "NV_POSTFLASH_SECTION", "NV_ADDTIONAL_SDKS_SECTION"]):
                raise Exception('Unexpected section', section["id"])

    def get_component_file_name(self, componentName, fileContext):
        componentFileName = fileContext["fileName"]
        if "packageName" in fileContext:
            componentFileName = fileContext["packageName"]
            if componentFileName == "cuda-toolkit-10-2":
                componentFileName = "toolkit"

        return componentFileName

if __name__ == "__main__":
    ManifestProcessor.run()
