# using a smaller image doesn't save us any space as the layers are used by the other images.
ARG VERSION_ID
FROM ubuntu:${VERSION_ID}

RUN mkdir /data

ARG ROOT_FS
COPY ./${ROOT_FS}  ./data

ARG ROOT_FS_MD5

ENV ROOT_FS=$ROOT_FS
ENV ROOT_FS_MD5=$ROOT_FS_MD5
