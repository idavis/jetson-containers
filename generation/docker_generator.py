import os
from plumbum import cli
import pathlib
import yaml
import jinja2
from jinja2 import Template


import logging
log = logging.getLogger()

# Current IDs
# Jetson Xavier NX            P3668-0000    Supplied with developer kit
#                             P3668-0001    Production
# Jetson Nano                 P3448-0000    Supplied with developer kit
#                             P3448-0002    Production
# Jetson AGX Xavier series    P2888-0001    16 GB memory
#                             P2888-0004    32 GB memory
#                             P2888-0006    8 GB memory
# Jetson TX2 series           P3310-1000    Jetson TX2
#                             P3489-0000    Jetson TX2i
#                             P3489-0888    Jetson TX2 4GB
# Jetson TX1                  P2180-1000  

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

def get_current_device_id(device):
    if device in v4deviceIdToPartNameDeviceIdLookup:
        return v4deviceIdToPartNameDeviceIdLookup[device]
    if device in deviceIdToCurrentIdLookup:
        return deviceIdToCurrentIdLookup[device]
    raise Exception('Unexpected device', device)

deviceIdToFriendlyNameLookup = {
    "P2888": "Jetson AGX Xavier",
    "P2888-0001": "Jetson AGX Xavier",
    "P2888-0004": "Jetson AGX Xavier [32GB]",
    "P2888-0060": "Jetson AGX Xavier [8GB]",
    "P2888-0006": "Jetson AGX Xavier [8GB]",
    "P3668-0000": "Jetson Xavier NX (Developer Kit version)",
    "P3668-0001": "Jetson Xavier NX",
    "P3310": "Jetson TX2",
    "P3310-1000": "Jetson TX2",
    "P3489-0000": "Jetson TX2i",
    "P3489-0080": "Jetson TX2 4GB",
    "P3489-0888": "Jetson TX2 4GB",
    "P2180": "Jetson TX1",
    "P2180-1000": "Jetson TX1",
    "P3448-0000": "Jetson Nano (Developer Kit version)",
    "P3448-0002": "Jetson Nano",
    "P3448-0020": "Jetson Nano"
}

deviceIdToTargetBoardLookup = {
    "P2888-0001": "jetson-xavier",
    "P2888-0004": "jetson-xavier",
    "P2888-0006": "jetson-xavier-8gb",
    "P3668-0000": "jetson-xavier-nx-devkit",
    "P3668-0001": "jetson-xavier-nx-devkit-emmc",
    "P3310-1000": "jetson-tx2",
    "P3489-0000": "jetson-tx2i",
    "P3489-0888": "jetson-tx2-4GB",
    "P2180-1000": "jetson-tx1",
    "P3448-0000": "jetson-nano-qspi-sd",
    "P3448-0002": "jetson-nano-emmc"
}

# Unused, just noting it is different than the SDK Manager
deviceIdToTargetBoardLookupDoc = {
    "P2888-0001": "jetson-agx-xavier-devkit",
    "P2888-0004": "jetson-agx-xavier-devkit",
    "P2888-0006": "jetson-agx-xavier-devkit-8gb",
    "P3668-0000": "jetson-xavier-nx-devkit",
    "P3668-0001": "jetson-xavier-nx-devkit-emmc",
    "P3310-1000": "jetson-tx2-devkit",
    "P3489-0000": "jetson-tx2-devkit-tx2i",
    "P3489-0888": "jetson-tx2-devkit-4GB",
    "P2180-1000": "jetson-tx1-devkit",
    "P3448-0000": "jetson-nano-devkit",
    "P3448-0002": "jetson-nano-emmc"
}

deviceToSoCLookup = {
    "P2888-0001": "194",
    "P2888-0004": "194",
    "P2888-0006": "194",
    "P3668-0000": "194",
    "P3668-0001": "194",
    "P3310-1000": "186",
    "P3489-0000": "186",
    "P3489-0888": "186",
    "P2180-1000": "210",
    "P3448-0000": "210",
    "P3448-0002": "210"
}

deviceIdToShortNameLookup = {
    "P2888": "jax",
    "P2888-0000": "jax",
    "P2888-0001": "jax",
    "P2888-0004": "jax-32gb",
    "P2888-0006": "jax-8gb",
    "P2888-0060": "jax-8gb",
    "P3668-0000": "nx-dev",
    "P3668-0001": "nx",
    "P3310": "tx2",
    "P3310-1000": "tx2",
    "P3489-0000": "tx2i",
    "P3489-0888": "tx2-4gb",
    "P3489-0080": "tx2-4gb",
    "P2180": "tx1",
    "P2180-1000": "tx1",
    "P3448-0000": "nano-dev",
    "P3448-0020": "nano",
    "P3448-0002": "nano"
}

shortNameToDeviceIdLookup = {
    "jax": "P2888-0001",
    "jax-32gb": "P2888-0004",
    "jax-8gb": "P2888-0006",
    "nx-dev": "P3668-0000",
    "nx": "P3668-0001",
    "tx2": "P3310-1000",
    "tx2i": "P3489-0000",
    "tx2-4gb": "P3489-0888",
    "tx1": "P2180-1000",
    "nano-dev": "P3448-0000",
    "nano": "P3448-0002"
}

active_versions = [
    "4.4",

    "4.3",

    "4.2.3",
    "4.2.2",
    "4.2.1",

    "4.2"
]

activeVersionsToSdkManagerVersionsLookup = {
    "4.4": "4.4",

    "4.3": "4.3",

    "4.2.3": "GA_4.2.3",
    "4.2.2": "GA_4.2.2",
    "4.2.1": "GA_4.2.1",

    "4.2": "4.2"

    # GA_3.3.2, GA_3.3.1
}


class DockerGenerator(cli.Application):
    PROGNAME = "Jetson Containers Repository Generator"
    VERSION = "1.0"

    @cli.switch("--verbose")
    def verbose(self):
        logging.root.setLevel(logging.DEBUG)

    def main(self):
        for device, name in deviceIdToFriendlyNameLookup.items():
            for jetpack_version in active_versions:
                filename = "l4t.yml"
                l4t_context_file = pathlib.Path(
                    f"dist/{jetpack_version}/l4t.yml")

                self.generate_cti_flash_files(
                    l4t_context_file, jetpack_version, device)

                self.generate_l4t_flash_files(
                    l4t_context_file, jetpack_version, device)

                l4t_template_dockerfile = pathlib.Path(
                    f"generation/ubuntu1804/l4t/Dockerfile.jinja")
                self.generate_l4t_dockerfiles(
                    l4t_context_file, l4t_template_dockerfile, jetpack_version, device)

                jetpack_context_file = pathlib.Path(
                    f"dist/{jetpack_version}/jetpack.yml")
                self.generate_jetpack_dockerfiles(
                    jetpack_context_file, l4t_context_file, jetpack_version, device)

        context = self.generate_l4t_makefile_context()

        l4t_flash_makefile_template_filepath = pathlib.Path(
            f"generation/ubuntu1804/flash/l4t/jetpack.mk.jinja")
        output_path = pathlib.Path(f"flash/")
        self.write_template(
            context, l4t_flash_makefile_template_filepath, output_path)

        l4t_makefile_template_filepath = pathlib.Path(
            f"generation/ubuntu1804/l4t/Makefile.jinja")
        self.generate_l4t_makefile(context, l4t_makefile_template_filepath)

        cti_bsp_table = self.read_yml_dictionary("generation/cti-bsp.yml")
        tasksjson_template_filepath = pathlib.Path(
            f"generation/ubuntu1804/tasks.json.jinja")
        output_path = pathlib.Path(f".vscode/")
        tasks_context = {"l4t": context, "cti": cti_bsp_table}
        self.write_template(
            tasks_context, tasksjson_template_filepath, output_path)

        cti_bsp_template_filepath = pathlib.Path(
            f"generation/ubuntu1804/flash/cti.mk.jinja")
        output_path = pathlib.Path(f"flash/")
        tasks_context = {"l4t": context, "cti": cti_bsp_table}
        self.write_template(
            tasks_context, cti_bsp_template_filepath, output_path)

        jetpack_makefile_template_filepath = pathlib.Path(
            f"generation/ubuntu1804/jetpack/jetpack.mk.jinja")
        self.generate_jetpack_makefile(
            context, jetpack_makefile_template_filepath)

        jetpack_deps_makefile_template_filepath = pathlib.Path(
            f"generation/ubuntu1804/jetpack/dependencies.mk.jinja")
        self.generate_jetpack_makefile(
            context, jetpack_deps_makefile_template_filepath)

        jetpack_main_makefile_template_filepath = pathlib.Path(
            f"generation/ubuntu1804/jetpack/Makefile.jinja")
        self.generate_jetpack_makefile(
            context, jetpack_main_makefile_template_filepath)

        main_makefile_template_filepath = pathlib.Path(
            f"generation/ubuntu1804/Makefile.jinja")
        self.generate_main_makefile(context, main_makefile_template_filepath)

        cti_makefile_template_filepath = pathlib.Path(
            f"generation/ubuntu1804/cti/Makefile.jinja")
        output_path = pathlib.Path(f"docker/cti")
        self.write_template(
            cti_bsp_table, cti_makefile_template_filepath, output_path)
        print("Done")

    def generate_main_makefile(self, context, template_filepath):
        # TODO, handle cases where context/template don't suport the device
        output_path = pathlib.Path(f"./")
        self.write_template(context, template_filepath, output_path)

    def generate_jetpack_makefile(self, context, template_filepath):
        # TODO, handle cases where context/template don't suport the device
        output_path = pathlib.Path(f"docker/jetpack")
        self.write_template(context, template_filepath, output_path)

    def generate_l4t_dockerfiles(self, context_file, template_filepath, jetpack_version, device):
        # TODO, handle cases where context/template don't suport the device
        context = self.read_yml_dictionary(context_file)
        if device not in context:
            print(
                f"Skipping {deviceIdToFriendlyNameLookup[device]} for JetPack {jetpack_version}")
            return
        print(f'l4t-{device}-jetpack-{jetpack_version}')
        deviceData = context[device]
        driverVersion = deviceData["drivers"]["version"]
        deviceData["SOC"] = deviceToSoCLookup[device]
        deviceData["jetpackVersion"] = jetpack_version
        deviceData["target_overlay"] = False

        output_path = pathlib.Path(
            f"docker/l4t/{driverVersion}/{deviceIdToShortNameLookup[device]}")
        self.write_template(deviceData, template_filepath, output_path)

    def generate_jetpack_dockerfiles(self, jetpack_context_file, l4t_context_file, jetpack_version, device):
        context = self.read_yml_dictionary(jetpack_context_file)
        if device not in context:
            print(
                f"Skipping {deviceIdToFriendlyNameLookup[device]} for JetPack {jetpack_version}")
            return

        deviceData = context[device]

        driver_context = self.read_yml_dictionary(l4t_context_file)
        device_driver_context = driver_context[device]
        for key, value in device_driver_context.items():
            deviceData[key] = value
        deviceData["shortName"] = deviceIdToShortNameLookup[device]
        deviceData["jetpackVersion"] = jetpack_version

        for img in ["base", "runtime", "runtime/cudnn", "deepstream", "devel", "devel/cudnn", "all", "samples"]:
            if img is "deepstream" and "deepstream" not in deviceData:
                continue

            print(f"{device}-{jetpack_version}-{img}")
            template_filepath = pathlib.Path(
                f"generation/ubuntu1804/jetpack/{img}/Dockerfile.jinja")

            output_path = pathlib.Path(
                f"docker/jetpack/{jetpack_version}/{deviceIdToShortNameLookup[device]}/{img}")
            self.write_template(deviceData, template_filepath, output_path)

    def generate_l4t_makefile(self, context, template_filepath):
        # TODO, handle cases where context/template don't suport the device
        output_path = pathlib.Path(f"docker/l4t")
        self.write_template(context, template_filepath, output_path)

    def generate_l4t_makefile_context(self):
        make_context = {}
        filename = "l4t.yml"
        for jetpack_version in active_versions:
            context_file = pathlib.Path(f"dist/{jetpack_version}/l4t.yml")
            context = self.read_yml_dictionary(context_file)

            for device, deviceData in context.items():
                device = get_current_device_id(device)
                
                driver_version = deviceData["drivers"]["version"]
                if driver_version not in make_context:
                    make_context[driver_version] = {}
                deviceData["jetpackVersion"] = jetpack_version
                deviceData["deviceId"] = device
                deviceData["sdkmanagerJetPackVersion"] = activeVersionsToSdkManagerVersionsLookup[jetpack_version]
                make_context[driver_version][deviceIdToShortNameLookup[device]] = deviceData
        return make_context

    def generate_l4t_flash_files(self, context_file, jetpack_version, device):
        # TODO, handle cases where context/template don't suport the device
        context = self.read_yml_dictionary(context_file)
        if device not in context:
            print(f"Skipping {deviceIdToFriendlyNameLookup[device]}")
            return
        print(f'l4t-flash-{device}')
        deviceData = context[device]
        driverVersion = deviceData["drivers"]["version"]
        deviceData["SOC"] = deviceToSoCLookup[device]
        deviceData["target_overlay"] = True
        deviceData["target_board"] = deviceIdToTargetBoardLookup[device]

        device = deviceIdToShortNameLookup[device]
        print(f"{device}-{driverVersion}-flash")
        component = "bsp"

        template_filepath = pathlib.Path(
            f"generation/ubuntu1804/flash/l4t/{component}.jinja")
        output_path = pathlib.Path(
            f"flash/l4t/{driverVersion}/{component}/{device}.conf")
        self.write_template_to_target(
            deviceData, template_filepath, output_path)

        component = "conf"
        template_filepath = pathlib.Path(
            f"generation/ubuntu1804/flash/l4t/{component}.jinja")
        conf_context = {}
        conf_context["bsp"] = f"{device}.conf"
        conf_context["rootfs"] = f"tegra-linux-sample-{driverVersion}-{device}.conf"
        conf_context["deps_image"] = f"$REPO:{driverVersion}-{device}-jetpack-{jetpack_version}-deps"
        conf_context["fs_deps_image"] = f"$REPO:{driverVersion}-{device}-jetpack-{jetpack_version}-deps"
        output_path = pathlib.Path(
            f"flash/l4t/{driverVersion}/{component}/{driverVersion}-{device}-jetpack-{jetpack_version}-image")
        self.write_template_to_target(
            conf_context, template_filepath, output_path)

        component = "rootfs"
        template_filepath = pathlib.Path(
            f"generation/ubuntu1804/flash/l4t/{component}.jinja")
        output_path = pathlib.Path(
            f"flash/l4t/{driverVersion}/{component}/tegra-linux-sample-{driverVersion}-{device}.conf")
        self.write_template_to_target(
            deviceData, template_filepath, output_path)

        component = "default.Dockerfile"
        template_filepath = pathlib.Path(
            f"generation/ubuntu1804/flash/l4t/{component}.jinja")
        output_path = pathlib.Path(f"flash/l4t/{driverVersion}/")
        self.write_template(deviceData, template_filepath, output_path)

    def generate_cti_flash_files(self, context_file, jetpack_version, device):

        # TODO, handle cases where context/template don't suport the device
        l4t_context = self.read_yml_dictionary(context_file)
        if device not in l4t_context:
            print(f"Skipping CTI for {device} - {deviceIdToFriendlyNameLookup[device]} as no context found.")
            return
        cti_bsp_table = self.read_yml_dictionary("generation/cti-bsp.yml")
        if deviceIdToShortNameLookup[device] not in cti_bsp_table:
            print(f"Skipping CTI for {device} - {deviceIdToFriendlyNameLookup[device]} as no BSP found.")
            return
        if jetpack_version not in cti_bsp_table[deviceIdToShortNameLookup[device]]:
            print(f"Skipping CTI for {device} - {deviceIdToFriendlyNameLookup[device]} as BSP didn't suport JP {jetpack_version}.")
            return
        targetBsp = cti_bsp_table[deviceIdToShortNameLookup[device]
                                  ][jetpack_version]

        print(f'cti-flash-{device}')
        deviceData = l4t_context[device]

        driverVersion = deviceData["drivers"]["version"]
        deviceData["SOC"] = deviceToSoCLookup[device]

        deviceData["target_overlay"] = True
        deviceData["target_board"] = deviceIdToTargetBoardLookup[device]
        device = deviceIdToShortNameLookup[device]
        bspVersion = targetBsp["bsp"]["version"].lower()
        targetBsp["bsp"]["bsp_deps_image"] = f"$REPO:cti-{driverVersion}-{device}-bsp-{bspVersion}-deps"
        context = {"l4t": deviceData, "cti": targetBsp}

        component = "bsp"

        template_filepath = pathlib.Path(
            f"generation/ubuntu1804/flash/cti/{component}.jinja")

        output_path = pathlib.Path(
            f"flash/cti/{driverVersion}/{component}/{device}-bsp-{bspVersion}.conf")
        self.write_template_to_target(
            context, template_filepath, output_path)

        component = "conf"
        template_filepath = pathlib.Path(
            f"generation/ubuntu1804/flash/cti/{component}.jinja")
        conf_context = {}
        conf_context["device"] = f"{device}"
        conf_context["bsp"] = f"{bspVersion}.conf"
        conf_context["rootfs"] = f"tegra-linux-sample-{driverVersion}-{device}.conf"
        conf_context["deps_image"] = f"$REPO:{driverVersion}-{device}-jetpack-{jetpack_version}-deps"
        conf_context["fs_deps_image"] = f"$REPO:{driverVersion}-{device}-jetpack-{jetpack_version}-deps"

        output_path = pathlib.Path(
            f"flash/cti/{driverVersion}/{component}/{driverVersion}-{device}-jetpack-{jetpack_version}-bsp-{bspVersion}-image")
        self.write_template_to_target(
            conf_context, template_filepath, output_path)

        component = "rootfs"
        template_filepath = pathlib.Path(
            f"generation/ubuntu1804/flash/cti/{component}.jinja")
        output_path = pathlib.Path(
            f"flash/cti/{driverVersion}/{component}/tegra-linux-sample-{driverVersion}-{device}.conf")
        self.write_template_to_target(
            context, template_filepath, output_path)

        component = "default.Dockerfile"
        template_filepath = pathlib.Path(
            f"generation/ubuntu1804/flash/cti/{component}.jinja")
        output_path = pathlib.Path(f"flash/cti/{driverVersion}/")
        self.write_template(context, template_filepath, output_path)

    def write_template_to_target(self, deviceData, template_filepath, output_path):
        with open(template_filepath) as f:
            log.debug("Processing template %s", template_filepath)
            new_output_path = pathlib.Path(output_path).parent
            new_filename = output_path.name

            template = Template(f.read())
            if not new_output_path.exists():
                log.debug(f"Creating {new_output_path}")
                new_output_path.mkdir(parents=True)
            print(f"Writing {new_output_path}/{new_filename}")
            with open(f"{new_output_path}/{new_filename}", "w") as f2:
                f2.write(template.render(ctx=deviceData))

    def write_template(self, context, template_filepath, output_path):
        with open(template_filepath) as f:
            log.debug("Processing template %s", template_filepath)
            new_output_path = pathlib.Path(output_path)
            new_filename = template_filepath.name[:-6]

            template = Template(f.read())
            if not new_output_path.exists():
                log.debug(f"Creating {new_output_path}")
                new_output_path.mkdir(parents=True)
            print(f"Writing {new_output_path}/{new_filename}")
            with open(f"{new_output_path}/{new_filename}", "w") as f2:
                f2.write(template.render(ctx=context))

    def read_yml_dictionary(self, filepath):
        with open(filepath) as f:
            file_context = yaml.load(f)
            context = {}
            for key, val in file_context.items():
                if key in v4deviceIdToPartNameDeviceIdLookup:
                    context[v4deviceIdToPartNameDeviceIdLookup[key]] = val
                else:
                    context[key] = val
            return context


if __name__ == "__main__":
    DockerGenerator.run()
