#!make

cti-deps: cti-jax-deps cti-jax-8gb-deps cti-nx-deps cti-nano-deps cti-tx1-deps cti-tx2-deps cti-tx2-4gb-deps cti-tx2i-deps 

cti-jax-deps: cti-32.1-jax-bsp-v203-deps cti-32.2.0-jax-bsp-v204-deps cti-32.2.1-jax-bsp-agx-32.2.1-v002-deps cti-32.3.1-jax-bsp-agx-32.3.1-v007-deps cti-32.4.3-jax-bsp-agx-32.4.3-v001-deps 
cti-jax-8gb-deps: cti-32.2.1-jax-8gb-bsp-agx-32.2.1-v002-deps cti-32.3.1-jax-8gb-bsp-agx-32.3.1-v007-deps cti-32.4.3-jax-8gb-bsp-agx-32.4.3-v001-deps 
cti-nx-deps: cti-32.4.3-nx-bsp-xavier-nx-32.4.3-v003-deps 
cti-nano-deps: cti-32.2.1-nano-bsp-nano-32.2.1-v001-deps cti-32.3.1-nano-bsp-nano-32.3.1-v005-deps cti-32.4.3-nano-bsp-nano-32.4.3-v001-deps 
cti-tx1-deps: cti-32.2.1-tx1-bsp-tx1-32.2.1-v001-deps cti-32.3.1-tx1-bsp-tx1-32.3.1-v004-deps 
cti-tx2-deps: cti-32.1-tx2-bsp-v125-deps cti-32.2.0-tx2-bsp-v126-1-deps cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-deps cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-deps cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-deps 
cti-tx2-4gb-deps: cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-deps cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-deps cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-deps 
cti-tx2i-deps: cti-32.1-tx2i-bsp-v125-deps cti-32.2.0-tx2i-bsp-v126-1-deps cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-deps cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-deps cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-deps 



cti-32.1-jax-bsp-v203-deps:
	BSP_VERSION=V203 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-V203

cti-32.2.0-jax-bsp-v204-deps:
	BSP_VERSION=V204 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-V204

cti-32.2.1-jax-bsp-agx-32.2.1-v002-deps:
	BSP_VERSION=AGX-32.2.1-V002 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-AGX-32.2.1-V002

cti-32.3.1-jax-bsp-agx-32.3.1-v007-deps:
	BSP_VERSION=AGX-32.3.1-V007 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-AGX-32.3.1-V007

cti-32.4.3-jax-bsp-agx-32.4.3-v001-deps:
	BSP_VERSION=AGX-32.4.3-V001 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-AGX-32.4.3-V001


cti-32.2.1-jax-8gb-bsp-agx-32.2.1-v002-deps:
	BSP_VERSION=AGX-32.2.1-V002 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-AGX-32.2.1-V002

cti-32.3.1-jax-8gb-bsp-agx-32.3.1-v007-deps:
	BSP_VERSION=AGX-32.3.1-V007 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-AGX-32.3.1-V007

cti-32.4.3-jax-8gb-bsp-agx-32.4.3-v001-deps:
	BSP_VERSION=AGX-32.4.3-V001 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-AGX-32.4.3-V001


cti-32.4.3-nx-bsp-xavier-nx-32.4.3-v003-deps:
	BSP_VERSION=XAVIER-NX-32.4.3-V003 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-XAVIER-NX-32.4.3-V003


cti-32.2.1-nano-bsp-nano-32.2.1-v001-deps:
	BSP_VERSION=NANO-32.2.1-V001 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-NANO-32.2.1-V001

cti-32.3.1-nano-bsp-nano-32.3.1-v005-deps:
	BSP_VERSION=NANO-32.3.1-V005 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-NANO-32.3.1-V005

cti-32.4.3-nano-bsp-nano-32.4.3-v001-deps:
	BSP_VERSION=NANO-32.4.3-V001 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-NANO-32.4.3-V001


cti-32.2.1-tx1-bsp-tx1-32.2.1-v001-deps:
	BSP_VERSION=TX1-32.2.1-V001 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-TX1-32.2.1-V001

cti-32.3.1-tx1-bsp-tx1-32.3.1-v004-deps:
	BSP_VERSION=TX1-32.3.1-V004 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-TX1-32.3.1-V004


cti-32.1-tx2-bsp-v125-deps:
	BSP_VERSION=V125 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-V125

cti-32.2.0-tx2-bsp-v126-1-deps:
	BSP_VERSION=V126-1 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-V126-1

cti-32.2.1-tx2-bsp-tx2-32.2.1-v004-deps:
	BSP_VERSION=TX2-32.2.1-V004 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-TX2-32.2.1-V004

cti-32.3.1-tx2-bsp-tx2-32.3.1-v003-deps:
	BSP_VERSION=TX2-32.3.1-V003 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-TX2-32.3.1-V003

cti-32.4.3-tx2-bsp-tx2-32.4.3-v002-deps:
	BSP_VERSION=TX2-32.4.3-V002 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-TX2-32.4.3-V002


cti-32.2.1-tx2-4gb-bsp-tx2-32.2.1-v004-deps:
	BSP_VERSION=TX2-32.2.1-V004 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-TX2-32.2.1-V004

cti-32.3.1-tx2-4gb-bsp-tx2-32.3.1-v003-deps:
	BSP_VERSION=TX2-32.3.1-V003 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-TX2-32.3.1-V003

cti-32.4.3-tx2-4gb-bsp-tx2-32.4.3-v002-deps:
	BSP_VERSION=TX2-32.4.3-V002 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-TX2-32.4.3-V002


cti-32.1-tx2i-bsp-v125-deps:
	BSP_VERSION=V125 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-V125

cti-32.2.0-tx2i-bsp-v126-1-deps:
	BSP_VERSION=V126-1 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-V126-1

cti-32.2.1-tx2i-bsp-tx2-32.2.1-v004-deps:
	BSP_VERSION=TX2-32.2.1-V004 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-TX2-32.2.1-V004

cti-32.3.1-tx2i-bsp-tx2-32.3.1-v003-deps:
	BSP_VERSION=TX2-32.3.1-V003 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-TX2-32.3.1-V003

cti-32.4.3-tx2i-bsp-tx2-32.4.3-v002-deps:
	BSP_VERSION=TX2-32.4.3-V002 /bin/bash -c ./download-bsp.sh

	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$@ \
					-f $(CURDIR)/dependencies.Dockerfile \
					/tmp/CTI-L4T-TX2-32.4.3-V002


%-from-folder:
	$(DOCKER) build \
					--build-arg VERSION_ID="$(BIONIC_VERSION_ID)" \
					-t $(REPO):$*-deps \
					-f $(CURDIR)/dependencies.Dockerfile \
					$(SDKM_DOWNLOADS)