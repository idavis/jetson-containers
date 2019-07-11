# using a smaller image doesn't save us any space as the layers are used by the other images.
ARG VERSION_ID=bionic-20190307
FROM ubuntu:${VERSION_ID}
RUN mkdir /data
COPY ./  ./data