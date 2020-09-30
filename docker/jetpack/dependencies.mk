#!make

NV_LOGIN_TYPE ?= devzone

all-dependencies: 32.4.3-jetpack-4.4-deps 32.3.1-jetpack-4.3-deps 32.2.3-jetpack-4.2.3-deps 32.2.1-jetpack-4.2.2-deps 32.2.0-jetpack-4.2.1-deps 32.1-jetpack-4.2-deps 

%-from-deps-folder:
	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$*-deps \
					-f $(CURDIR)/dependencies.Dockerfile \
					$(SDKM_DOWNLOADS)

32.4.3-jetpack-4.4-deps: 32.4.3-jax-jetpack-4.4-deps 32.4.3-jax-8gb-jetpack-4.4-deps 32.4.3-nano-jetpack-4.4-deps 32.4.3-nano-dev-jetpack-4.4-deps 32.4.3-tx1-jetpack-4.4-deps 32.4.3-tx2-jetpack-4.4-deps 32.4.3-tx2i-jetpack-4.4-deps 32.4.3-tx2-4gb-jetpack-4.4-deps 32.4.3-nx-jetpack-4.4-deps 32.4.3-nx-dev-jetpack-4.4-deps 
32.3.1-jetpack-4.3-deps: 32.3.1-tx1-jetpack-4.3-deps 32.3.1-jax-jetpack-4.3-deps 32.3.1-jax-8gb-jetpack-4.3-deps 32.3.1-tx2-jetpack-4.3-deps 32.3.1-nano-dev-jetpack-4.3-deps 32.3.1-nano-jetpack-4.3-deps 32.3.1-tx2i-jetpack-4.3-deps 32.3.1-tx2-4gb-jetpack-4.3-deps 
32.2.3-jetpack-4.2.3-deps: 32.2.3-tx1-jetpack-4.2.3-deps 32.2.3-jax-jetpack-4.2.3-deps 32.2.3-jax-8gb-jetpack-4.2.3-deps 32.2.3-tx2-jetpack-4.2.3-deps 32.2.3-nano-dev-jetpack-4.2.3-deps 32.2.3-nano-jetpack-4.2.3-deps 32.2.3-tx2i-jetpack-4.2.3-deps 32.2.3-tx2-4gb-jetpack-4.2.3-deps 
32.2.1-jetpack-4.2.2-deps: 32.2.1-tx1-jetpack-4.2.2-deps 32.2.1-jax-jetpack-4.2.2-deps 32.2.1-jax-8gb-jetpack-4.2.2-deps 32.2.1-tx2-jetpack-4.2.2-deps 32.2.1-nano-dev-jetpack-4.2.2-deps 32.2.1-nano-jetpack-4.2.2-deps 32.2.1-tx2i-jetpack-4.2.2-deps 32.2.1-tx2-4gb-jetpack-4.2.2-deps 
32.2.0-jetpack-4.2.1-deps: 32.2.0-tx1-jetpack-4.2.1-deps 32.2.0-jax-jetpack-4.2.1-deps 32.2.0-tx2-jetpack-4.2.1-deps 32.2.0-nano-dev-jetpack-4.2.1-deps 32.2.0-nano-jetpack-4.2.1-deps 32.2.0-tx2i-jetpack-4.2.1-deps 32.2.0-tx2-4gb-jetpack-4.2.1-deps 
32.1-jetpack-4.2-deps: 32.1-jax-jetpack-4.2-deps 32.1-tx2-jetpack-4.2-deps 32.1-nano-dev-jetpack-4.2-deps 32.1-tx2i-jetpack-4.2-deps 




32.4.3-jax-jetpack-4.4-deps:
	DEVICE_ID=P2888 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="4.4" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.4/P2888

32.4.3-jax-8gb-jetpack-4.4-deps:
	DEVICE_ID=P2888-0060 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="4.4" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.4/P2888-0060

32.4.3-nano-jetpack-4.4-deps:
	DEVICE_ID=P3448-0020 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="4.4" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.4/P3448-0020

32.4.3-nano-dev-jetpack-4.4-deps:
	DEVICE_ID=P3448-0000 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="4.4" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.4/P3448-0000

32.4.3-tx1-jetpack-4.4-deps:
	DEVICE_ID=P2180 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="4.4" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.4/P2180

32.4.3-tx2-jetpack-4.4-deps:
	DEVICE_ID=P3310 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="4.4" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.4/P3310

32.4.3-tx2i-jetpack-4.4-deps:
	DEVICE_ID=P3489-0000 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="4.4" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.4/P3489-0000

32.4.3-tx2-4gb-jetpack-4.4-deps:
	DEVICE_ID=P3489-0080 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="4.4" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.4/P3489-0080

32.4.3-nx-jetpack-4.4-deps:
	DEVICE_ID=P3668-0001 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="4.4" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.4/P3668-0001

32.4.3-nx-dev-jetpack-4.4-deps:
	DEVICE_ID=P3668-0000 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="4.4" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.4/P3668-0000



32.3.1-tx1-jetpack-4.3-deps:
	DEVICE_ID=P2180 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="4.3" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.3/P2180

32.3.1-jax-jetpack-4.3-deps:
	DEVICE_ID=P2888 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="4.3" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.3/P2888

32.3.1-jax-8gb-jetpack-4.3-deps:
	DEVICE_ID=P2888-0060 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="4.3" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.3/P2888-0060

32.3.1-tx2-jetpack-4.3-deps:
	DEVICE_ID=P3310 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="4.3" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.3/P3310

32.3.1-nano-dev-jetpack-4.3-deps:
	DEVICE_ID=P3448-0000 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="4.3" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.3/P3448-0000

32.3.1-nano-jetpack-4.3-deps:
	DEVICE_ID=P3448-0020 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="4.3" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.3/P3448-0020

32.3.1-tx2i-jetpack-4.3-deps:
	DEVICE_ID=P3489-0000 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="4.3" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.3/P3489-0000

32.3.1-tx2-4gb-jetpack-4.3-deps:
	DEVICE_ID=P3489-0080 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="4.3" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.3/P3489-0080



32.2.3-tx1-jetpack-4.2.3-deps:
	DEVICE_ID=P2180 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.3" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.3/P2180

32.2.3-jax-jetpack-4.2.3-deps:
	DEVICE_ID=P2888 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.3" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.3/P2888

32.2.3-jax-8gb-jetpack-4.2.3-deps:
	DEVICE_ID=P2888-0060 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.3" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.3/P2888-0060

32.2.3-tx2-jetpack-4.2.3-deps:
	DEVICE_ID=P3310 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.3" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.3/P3310

32.2.3-nano-dev-jetpack-4.2.3-deps:
	DEVICE_ID=P3448-0000 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.3" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.3/P3448-0000

32.2.3-nano-jetpack-4.2.3-deps:
	DEVICE_ID=P3448-0020 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.3" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.3/P3448-0020

32.2.3-tx2i-jetpack-4.2.3-deps:
	DEVICE_ID=P3489-0000 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.3" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.3/P3489-0000

32.2.3-tx2-4gb-jetpack-4.2.3-deps:
	DEVICE_ID=P3489-0080 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.3" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.3/P3489-0080



32.2.1-tx1-jetpack-4.2.2-deps:
	DEVICE_ID=P2180 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.2" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.2/P2180

32.2.1-jax-jetpack-4.2.2-deps:
	DEVICE_ID=P2888 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.2" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.2/P2888

32.2.1-jax-8gb-jetpack-4.2.2-deps:
	DEVICE_ID=P2888-0060 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.2" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.2/P2888-0060

32.2.1-tx2-jetpack-4.2.2-deps:
	DEVICE_ID=P3310 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.2" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.2/P3310

32.2.1-nano-dev-jetpack-4.2.2-deps:
	DEVICE_ID=P3448-0000 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.2" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.2/P3448-0000

32.2.1-nano-jetpack-4.2.2-deps:
	DEVICE_ID=P3448-0020 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.2" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.2/P3448-0020

32.2.1-tx2i-jetpack-4.2.2-deps:
	DEVICE_ID=P3489-0000 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.2" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.2/P3489-0000

32.2.1-tx2-4gb-jetpack-4.2.2-deps:
	DEVICE_ID=P3489-0080 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.2" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.2/P3489-0080



32.2.0-tx1-jetpack-4.2.1-deps:
	DEVICE_ID=P2180 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.1" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.1/P2180

32.2.0-jax-jetpack-4.2.1-deps:
	DEVICE_ID=P2888 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.1" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.1/P2888

32.2.0-tx2-jetpack-4.2.1-deps:
	DEVICE_ID=P3310 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.1" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.1/P3310

32.2.0-nano-dev-jetpack-4.2.1-deps:
	DEVICE_ID=P3448-0000 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.1" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.1/P3448-0000

32.2.0-nano-jetpack-4.2.1-deps:
	DEVICE_ID=P3448-0020 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.1" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.1/P3448-0020

32.2.0-tx2i-jetpack-4.2.1-deps:
	DEVICE_ID=P3489-0000 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.1" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.1/P3489-0000

32.2.0-tx2-4gb-jetpack-4.2.1-deps:
	DEVICE_ID=P3489-0080 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="GA_4.2.1" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/GA_4.2.1/P3489-0080



32.1-jax-jetpack-4.2-deps:
	DEVICE_ID=P2888 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="4.2" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.2/P2888

32.1-tx2-jetpack-4.2-deps:
	DEVICE_ID=P3310 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="4.2" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.2/P3310

32.1-nano-dev-jetpack-4.2-deps:
	DEVICE_ID=P3448-0000 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="4.2" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.2/P3448-0000

32.1-tx2i-jetpack-4.2-deps:
	DEVICE_ID=P3489-0000 DEVICE_OPTION=--target NV_LOGIN_TYPE=$(NV_LOGIN_TYPE) PRODUCT=Jetson JETPACK_VERSION="4.2" TARGET_OS=Linux ACCEPT_SDK_LICENCE=accept /bin/bash -c ./download-jetpack.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/4.2/P3489-0000

