#!make

.PHONY: all

all: 32.1

32.1: $(addprefix 32.1-,jax tx2 jax-tx2 nano)

32.1-jax:
	$(DOCKER) build --build-arg VERSION_ID="$(VERSION_ID)" \
                    -t $(REPO):$@ -f 32.1/jax-tx2/Dockerfile .

32.1-tx2:
	$(DOCKER) build --build-arg VERSION_ID="$(VERSION_ID)" \
                    -t $(REPO):$@ -f 32.1/jax-tx2/Dockerfile .

32.1-jax-tx2: 32.1-jax 32.1-tx2

32.1-nano:
	$(DOCKER) build --build-arg VERSION_ID="$(VERSION_ID)" \
                    -t $(REPO):$@ -f 32.1/nano/Dockerfile .

#31.1:
#28.2.1:
#28.2:
#28.1: