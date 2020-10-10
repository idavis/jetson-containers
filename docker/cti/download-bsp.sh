#!/bin/bash
set -e

echo "mkdir -p /tmp/CTI-L4T-${BSP_VERSION}"
mkdir -p /tmp/CTI-L4T-${BSP_VERSION}

echo "curl -sSL https://www.connecttech.com/ftp/Drivers/CTI-L4T-${BSP_VERSION}.tgz -o /tmp/CTI-L4T-${BSP_VERSION}/CTI-L4T-${BSP_VERSION}.tgz"
curl -sSL https://www.connecttech.com/ftp/Drivers/CTI-L4T-${BSP_VERSION}.tgz -o /tmp/CTI-L4T-${BSP_VERSION}/CTI-L4T-${BSP_VERSION}.tgz
