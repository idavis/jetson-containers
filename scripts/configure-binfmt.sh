#! /bin/bash

if [ ! -f /lib/binfmt.d/qemu-aarch64-static.conf ]; then
    sudo mkdir -p /lib/binfmt.d

    # Create a configuration for arm64v8
    sudo sh -c 'echo :qemu-aarch64:M::\\x7f\\x45\\x4c\\x46\\x02\\x01\\x01\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x02\\x00\\xb7\\x00:\\xff\\xff\\xff\\xff\\xff\\xff\\xff\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\xfe\\xff\\xff\\xff:/usr/bin/qemu-aarch64-static:F > /lib/binfmt.d/qemu-aarch64-static.conf'

    # Restart the service to force an evaluation of the /lib/binfmt.d directory
    sudo systemctl restart systemd-binfmt.service
fi