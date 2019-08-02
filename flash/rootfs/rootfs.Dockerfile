# using a smaller image doesn't save us any space as the layers are used by the other images.
ARG VERSION_ID
FROM ubuntu:${VERSION_ID}
RUN mkdir /data
COPY ./  ./data

ARG ROOT_FS
ARG ROOT_FS_SHA
ARG ROOT_FS_URL

ENV ROOT_FS=$ROOT_FS
ENV ROOT_FS_SHA=$ROOT_FS_SHA
ENV ROOT_FS_URL=$ROOT_FS_URL