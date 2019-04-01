#!make

.PHONY: all

all: 32.1-jax-jetpack-4.2 32.1-tx2-jetpack-4.2 32.1-nano-jetpack-4.2

32.1-jax-jetpack-4.2: $(addprefix 32.1-jax-jetpack-4.2-,base devel runtime)

32.1-jax-jetpack-4.2-base:
	$(DOCKER) build --build-arg VERSION_ID="$(VERSION_ID)" \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
	                --build-arg URL=$(JP42_URL) \
                    -t $(REPO):$@ -f 4.2/jax/base/Dockerfile .

32.1-jax-jetpack-4.2-runtime: 32.1-jax-jetpack-4.2-base
	$(DOCKER) build --build-arg VERSION_ID="$(VERSION_ID)" \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
	                --build-arg URL=$(JP42_URL) \
                    -t $(REPO):$@ -f 4.2/jax/runtime/Dockerfile .

32.1-jax-jetpack-4.2-devel: 32.1-jax-jetpack-4.2-runtime
	$(DOCKER) build --build-arg VERSION_ID="$(VERSION_ID)" \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
	                --build-arg URL=$(JP42_URL) \
                    -t $(REPO):$@ -f 4.2/jax/devel/Dockerfile .



32.1-nano-jetpack-4.2: $(addprefix 32.1-nano-jetpack-4.2-,base devel runtime)

32.1-nano-jetpack-4.2-base:
	$(DOCKER) build --build-arg VERSION_ID="$(VERSION_ID)" \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
	                --build-arg URL=$(JP42_URL) \
                    -t $(REPO):$@ -f 4.2/nano/base/Dockerfile .

32.1-nano-jetpack-4.2-runtime: 32.1-nano-jetpack-4.2-base
	$(DOCKER) build --build-arg VERSION_ID="$(VERSION_ID)" \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
	                --build-arg URL=$(JP42_URL) \
                    -t $(REPO):$@ -f 4.2/nano/runtime/Dockerfile .

32.1-nano-jetpack-4.2-devel: 32.1-nano-jetpack-4.2-runtime
	$(DOCKER) build --build-arg VERSION_ID="$(VERSION_ID)" \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
	                --build-arg URL=$(JP42_URL) \
                    -t $(REPO):$@ -f 4.2/nano/devel/Dockerfile .



32.1-tx2-jetpack-4.2: $(addprefix 32.1-tx2-jetpack-4.2-,base devel runtime)

32.1-tx2-jetpack-4.2-base:
	$(DOCKER) build --build-arg VERSION_ID="$(VERSION_ID)" \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
	                --build-arg URL=$(JP42_URL) \
                    -t $(REPO):$@ -f 4.2/tx2/base/Dockerfile .

32.1-tx2-jetpack-4.2-runtime: 32.1-tx2-jetpack-4.2-base
	$(DOCKER) build --build-arg VERSION_ID="$(VERSION_ID)" \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
	                --build-arg URL=$(JP42_URL) \
                    -t $(REPO):$@ -f 4.2/tx2/runtime/Dockerfile .

32.1-tx2-jetpack-4.2-devel: 32.1-tx2-jetpack-4.2-runtime
	$(DOCKER) build --build-arg VERSION_ID="$(VERSION_ID)" \
					--build-arg IMAGE_NAME=$(IMAGE_NAME) \
	                --build-arg URL=$(JP42_URL) \
                    -t $(REPO):$@ -f 4.2/tx2/devel/Dockerfile .




