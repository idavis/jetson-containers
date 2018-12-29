#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "You must specify the image tag to run."
    echo "$(basename "$(test -L "$0" && readlink "$0" || echo "$0")") <tag>"
    exit 1
fi

echo "sudo docker run --rm -it --privileged -v /dev/bus/usb:/dev/bus/usb $1"
sudo docker run --rm -it --privileged -v /dev/bus/usb:/dev/bus/usb $1

