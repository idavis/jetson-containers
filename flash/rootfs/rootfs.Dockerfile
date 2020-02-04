# using a smaller image doesn't save us any space as the layers are used by the other images.
ARG VERSION_ID
FROM ubuntu:${VERSION_ID}
RUN mkdir /data
COPY ./  ./data

ARG ROOT_FS
ARG ROOT_FS_MD5
ARG ROOT_FS_URL

ENV ROOT_FS=$ROOT_FS
ENV ROOT_FS_MD5=$ROOT_FS_MD5
ENV ROOT_FS_URL=$ROOT_FS_URL