# using a smaller image doesn't save us any space as the layers are used by the other images.
ARG VERSION_ID=bionic-20190307
FROM ubuntu:${VERSION_ID}

# copy over all SDK files need to carry to next image layer
RUN mkdir /data
COPY ./  ./data

# install qemu for cross building
RUN apt-get update && apt-get install -qqy qemu-user-static
