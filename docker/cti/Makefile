#!make

cti-deps: cti-tx1-deps cti-tx2-deps cti-tx2-4gb-deps cti-tx2i-deps cti-jax-8gb-deps cti-jax-deps cti-nano-deps 

cti-tx1-deps: cti-32.2.1-tx1-bsp-TX1-32.2.1-V001-deps 
cti-tx2-deps: cti-32.1-tx2-bsp-V125-deps cti-32.2.0-tx2-bsp-V126-1-deps cti-32.2.1-tx2-bsp-TX2-32.2.1-V004-deps 
cti-tx2-4gb-deps: cti-32.2.1-tx2-4gb-bsp-TX2-32.2.1-V004-deps 
cti-tx2i-deps: cti-32.1-tx2i-bsp-V125-deps cti-32.2.0-tx2i-bsp-V126-1-deps cti-32.2.1-tx2i-bsp-TX2-32.2.1-V004-deps 
cti-jax-8gb-deps: cti-32.2.1-jax-8gb-bsp-AGX-32.2.1-V002-deps 
cti-jax-deps: cti-32.1-jax-bsp-V203-deps cti-32.2.0-jax-bsp-V204-deps cti-32.2.1-jax-bsp-AGX-32.2.1-V002-deps 
cti-nano-deps: cti-32.2.1-nano-bsp-NANO-32.2.1-V001-deps 



cti-32.2.1-tx1-TX1-32.2.1-V001-deps:
	BSP_VERSION=TX1-32.2.1-V001 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-TX1-32.2.1-V001


cti-32.1-tx2-V125-deps:
	BSP_VERSION=V125 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-V125

cti-32.2.0-tx2-V126-1-deps:
	BSP_VERSION=V126-1 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-V126-1

cti-32.2.1-tx2-TX2-32.2.1-V004-deps:
	BSP_VERSION=TX2-32.2.1-V004 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-TX2-32.2.1-V004


cti-32.2.1-tx2-4gb-TX2-32.2.1-V004-deps:
	BSP_VERSION=TX2-32.2.1-V004 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-TX2-32.2.1-V004


cti-32.1-tx2i-V125-deps:
	BSP_VERSION=V125 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-V125

cti-32.2.0-tx2i-V126-1-deps:
	BSP_VERSION=V126-1 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-V126-1

cti-32.2.1-tx2i-TX2-32.2.1-V004-deps:
	BSP_VERSION=TX2-32.2.1-V004 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-TX2-32.2.1-V004


cti-32.2.1-jax-8gb-AGX-32.2.1-V002-deps:
	BSP_VERSION=AGX-32.2.1-V002 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-AGX-32.2.1-V002


cti-32.1-jax-V203-deps:
	BSP_VERSION=V203 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-V203

cti-32.2.0-jax-V204-deps:
	BSP_VERSION=V204 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-V204

cti-32.2.1-jax-AGX-32.2.1-V002-deps:
	BSP_VERSION=AGX-32.2.1-V002 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-AGX-32.2.1-V002


cti-32.2.1-nano-NANO-32.2.1-V001-deps:
	BSP_VERSION=NANO-32.2.1-V001 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-NANO-32.2.1-V001


%-from-folder:
	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$*-deps \
					-f $(CURDIR)/dependencies.Dockerfile \
					$(SDKM_DOWNLOADS)