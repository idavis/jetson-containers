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
    "4.2.1"
]

activeVersionsToSdkManagerVersionsLookup = {
    "4.3": "4.3",

    "4.2.3": "GA_4.2.3",
    "4.2.2": "GA_4.2.2",
    "4.2.1": "GA_4.2.1"
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
                context_file = pathlib.Path(f"dist/{jetpack_version}/l4t.yml")

                l4t_template_dockerfile = pathlib.Path(f"generation/ubuntu1804/l4t/Dockerfile.jinja")
                self.generate_l4t_dockerfiles(context_file, l4t_template_dockerfile, jetpack_version, device)

                self.generate_jetpack_dockerfiles(context_file, jetpack_version, device)
        
        l4t_makefile_template_filepath = pathlib.Path(f"generation/ubuntu1804/l4t/Makefile.jinja")
        self.generate_l4t_makefile(l4t_makefile_template_filepath)

        jetpack_makefile_template_filepath = pathlib.Path(f"generation/ubuntu1804/jetpack/jetpack.mk.jinja")
        self.generate_jetpack_makefile(jetpack_makefile_template_filepath)

        jetpack_deps_makefile_template_filepath = pathlib.Path(f"generation/ubuntu1804/jetpack/dependencies.mk.jinja")
        self.generate_jetpack_makefile(jetpack_deps_makefile_template_filepath)

        jetpack_main_makefile_template_filepath = pathlib.Path(f"generation/ubuntu1804/jetpack/Makefile.jinja")
        self.generate_jetpack_makefile(jetpack_main_makefile_template_filepath)
                    
        log.info("Done")

    def generate_jetpack_makefile(self, template_filepath):
        context = self.generate_l4t_makefile_context()
        # TODO, handle cases where context/template don't suport the device
        output_path = pathlib.Path(f"docker/jetpack")

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

    def generate_l4t_dockerfiles(self, context_file, template_filepath, jetpack_version, device):
        # TODO, handle cases where context/template don't suport the device
        context = self.read_yml_dictionary(context_file)
        if device not in context:
            log.info(f"Skipping {deviceIdToFriendlyNameLookup[device]} for JetPack {jetpack_version}")
            return
        deviceData = context[device]
        driverVersion = deviceData["drivers"]["version"]
        output_path = pathlib.Path(f"docker/l4t/{driverVersion}/{deviceIdToShortNameLookup[device]}")

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
                f2.write(template.render(ctx=deviceData))

    def generate_jetpack_dockerfiles(self, context_file, jetpack_version, device):
        for img in ["base", "devel", "runtime"]:
            template_filepath = pathlib.Path(f"generation/ubuntu1804/jetpack/{img}/Dockerfile.jinja")

            context = self.read_yml_dictionary(context_file)
            if device not in context:
                log.info(f"Skipping {deviceIdToFriendlyNameLookup[device]} for JetPack {jetpack_version}")
                return
            deviceData = context[device]
            driverVersion = deviceData["drivers"]["version"]
            output_path = pathlib.Path(f"docker/jetpack/{jetpack_version}/{deviceIdToShortNameLookup[device]}/{img}")

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
                    f2.write(template.render(ctx=deviceData))

    def generate_l4t_makefile(self, template_filepath):
        context = self.generate_l4t_makefile_context()
        # TODO, handle cases where context/template don't suport the device
        output_path = pathlib.Path(f"docker/l4t")

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

    def read_yml_dictionary(self, filepath):
        with open(filepath) as f:
            return yaml.load(f)
    
if __name__ == "__main__":
    DockerGenerator.run()
