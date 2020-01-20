import os
from plumbum import cli
import pathlib
import yaml
import jinja2
from jinja2 import Template


import logging
log = logging.getLogger()

deviceIdToFriendlyNameLookup = {
    "P2888": "Jetson AGX Xavier",
    "P2888-0060": "Jetson AGX Xavier 8GB",
    "P3310": "Jetson TX2",
    "P3489-0000": "Jetson TX2i",
    "P3489-0080": "Jetson TX2 4GB",
    "P2180": "Jetson TX1",
    "P3448-0000": "Jetson Nano (Developer Kit version)",
    "P3448-0020": "Jetson Nano"
}

deviceIdToTargetBoardLookup = {
    "P2888": "jetson-xavier",
    "P2888-0060": "jetson-xavier-8gb",
    "P3310": "jetson-tx2",
    "P3489-0000": "jetson-tx2i",
    "P3489-0080": "jetson-tx2-4GB",
    "P2180": "jetson-tx1",
    "P3448-0000": "jetson-nano-qspi-sd",
    "P3448-0020": "jetson-nano-emmc"
}

deviceToSoCLookup = {
    "P3310": "186",
    "P3489-0000": "186",
    "P3489-0080": "186",
    "P2888": "194",
    "P2888-0060": "194",
    "P3448-0000": "210",
    "P3448-0020": "210",
    "P2180": "210"
}

deviceIdToShortNameLookup = {
    "P2888": "jax",
    "P2888-0060": "jax-8gb",
    "P3310": "tx2",
    "P3489-0000": "tx2i",
    "P3489-0080": "tx2-4gb",
    "P2180": "tx1",
    "P3448-0000": "nano-dev",
    "P3448-0020": "nano"
}

active_versions = [
    "4.3",

    "4.2.3",
    "4.2.2",
    "4.2.1",

    "4.2"
]

activeVersionsToSdkManagerVersionsLookup = {
    "4.3": "4.3",

    "4.2.3": "GA_4.2.3",
    "4.2.2": "GA_4.2.2",
    "4.2.1": "GA_4.2.1",

    "4.2": "4.2"

    #GA_3.3.2, GA_3.3.1
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
                l4t_context_file = pathlib.Path(f"dist/{jetpack_version}/l4t.yml")

                self.generate_l4t_flash_files(l4t_context_file, jetpack_version, device)

                l4t_template_dockerfile = pathlib.Path(f"generation/ubuntu1804/l4t/Dockerfile.jinja")
                self.generate_l4t_dockerfiles(l4t_context_file, l4t_template_dockerfile, jetpack_version, device)

                jetpack_context_file = pathlib.Path(f"dist/{jetpack_version}/jetpack.yml")
                self.generate_jetpack_dockerfiles(jetpack_context_file, l4t_context_file, jetpack_version, device)
        
        context = self.generate_l4t_makefile_context()

        l4t_makefile_template_filepath = pathlib.Path(f"generation/ubuntu1804/l4t/Makefile.jinja")
        self.generate_l4t_makefile(context, l4t_makefile_template_filepath)

        jetpack_makefile_template_filepath = pathlib.Path(f"generation/ubuntu1804/jetpack/jetpack.mk.jinja")
        self.generate_jetpack_makefile(context, jetpack_makefile_template_filepath)

        jetpack_deps_makefile_template_filepath = pathlib.Path(f"generation/ubuntu1804/jetpack/dependencies.mk.jinja")
        self.generate_jetpack_makefile(context, jetpack_deps_makefile_template_filepath)

        jetpack_main_makefile_template_filepath = pathlib.Path(f"generation/ubuntu1804/jetpack/Makefile.jinja")
        self.generate_jetpack_makefile(context, jetpack_main_makefile_template_filepath)

        main_makefile_template_filepath = pathlib.Path(f"generation/ubuntu1804/Makefile.jinja")
        self.generate_main_makefile(context, main_makefile_template_filepath)

        log.info("Done")

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
            log.info(f"Skipping {deviceIdToFriendlyNameLookup[device]} for JetPack {jetpack_version}")
            return
        print(f'l4t-{device}-jetpack-{jetpack_version}')
        deviceData = context[device]
        driverVersion = deviceData["drivers"]["version"]
        deviceData["SOC"] = deviceToSoCLookup[device]
        
        output_path = pathlib.Path(f"docker/l4t/{driverVersion}/{deviceIdToShortNameLookup[device]}")
        self.write_template(deviceData, template_filepath, output_path)


    def generate_jetpack_dockerfiles(self, jetpack_context_file, l4t_context_file, jetpack_version, device):
        context = self.read_yml_dictionary(jetpack_context_file)
        if device not in context:
            log.info(f"Skipping {deviceIdToFriendlyNameLookup[device]} for JetPack {jetpack_version}")
            return

        deviceData = context[device]

        driver_context = self.read_yml_dictionary(l4t_context_file)
        device_driver_context = driver_context[device]
        for key, value in device_driver_context.items():
            deviceData[key] = value
        deviceData["shortName"] = deviceIdToShortNameLookup[device]
        deviceData["jetpackVersion"] = jetpack_version

        for img in ["base", "devel", "runtime"]:
            print(f"{device}-{jetpack_version}-{img}")
            template_filepath = pathlib.Path(f"generation/ubuntu1804/jetpack/{img}/Dockerfile.jinja")

            output_path = pathlib.Path(f"docker/jetpack/{jetpack_version}/{deviceIdToShortNameLookup[device]}/{img}")
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
            log.info(f"Skipping {deviceIdToFriendlyNameLookup[device]}")
            return
        print(f'l4t-flash-{device}')
        deviceData = context[device]
        driverVersion = deviceData["drivers"]["version"]
        deviceData["SOC"] = deviceToSoCLookup[device]
        deviceData["target_board"] = deviceIdToTargetBoardLookup[device]

        device = deviceIdToShortNameLookup[device]
        print(f"{device}-{driverVersion}-flash")
        component = "bsp"
        
        template_filepath = pathlib.Path(f"generation/ubuntu1804/flash/l4t/{component}.jinja")
        output_path = pathlib.Path(f"flash/l4t/{driverVersion}/{component}/{device}.conf")
        self.write_template_to_target(deviceData, template_filepath, output_path)

        component = "conf"
        template_filepath = pathlib.Path(f"generation/ubuntu1804/flash/l4t/{component}.jinja")
        conf_context = {}
        conf_context["bsp"] = f"{device}.conf"
        conf_context["rootfs"] = f"tegra-linux-sample-{driverVersion}-{device}.conf"
        conf_context["deps_image"] = f"$REPO:{driverVersion}-{device}-jetpack-{jetpack_version}-deps"
        conf_context["fs_deps_image"] = f"$REPO:{driverVersion}-{device}-jetpack-{jetpack_version}-deps"
        output_path = pathlib.Path(f"flash/l4t/{driverVersion}/{component}/{driverVersion}-{device}-jetpack-{jetpack_version}-image")
        self.write_template_to_target(conf_context, template_filepath, output_path)

        component = "rootfs"
        template_filepath = pathlib.Path(f"generation/ubuntu1804/flash/l4t/{component}.jinja")
        output_path = pathlib.Path(f"flash/l4t/{driverVersion}/{component}/tegra-linux-sample-{driverVersion}-{device}.conf")
        self.write_template_to_target(deviceData, template_filepath, output_path)

        component = "default.Dockerfile"
        template_filepath = pathlib.Path(f"generation/ubuntu1804/flash/l4t/{component}.jinja")
        output_path = pathlib.Path(f"flash/l4t/{driverVersion}/")
        self.write_template(deviceData, template_filepath, output_path)

    def write_template_to_target(self, deviceData, template_filepath, output_path):
        with open(template_filepath) as f:
            log.debug("Processing template %s", template_filepath)
            new_output_path = pathlib.Path(output_path).parent
            new_filename = output_path.name
 
            template = Template(f.read())
            if not new_output_path.exists():
                log.debug(f"Creating {new_output_path}")
                new_output_path.mkdir(parents=True)
            log.info(f"Writing {new_output_path}/{new_filename}")
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
            log.info(f"Writing {new_output_path}/{new_filename}")
            with open(f"{new_output_path}/{new_filename}", "w") as f2:
                f2.write(template.render(ctx=context))

    def read_yml_dictionary(self, filepath):
        with open(filepath) as f:
            return yaml.load(f)
    
if __name__ == "__main__":
    DockerGenerator.run()
