#!/bin/bash
set -e

echo "mkdir -p /tmp/CTI-L4T-V${BSP_VERSION}"
mkdir -p /tmp/CTI-L4T-V${BSP_VERSION}

echo "curl -sSL http://www.connecttech.com/ftp/Drivers/CTI-L4T-V${BSP_VERSION}.tgz -o /tmp/CTI-L4T-V${BSP_VERSION}/CTI-L4T-V${BSP_VERSION}.tgz"
curl -sSL http://www.connecttech.com/ftp/Drivers/CTI-L4T-V${BSP_VERSION}.tgz -o /tmp/CTI-L4T-V${BSP_VERSION}/CTI-L4T-V${BSP_VERSION}.tgz
