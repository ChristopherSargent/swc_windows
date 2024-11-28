#!/bin/bash

# Load environment variables from .env file
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs -d '\n')
fi

# Create Docker network
# docker network create --subnet 172.20.0.0/16 --ip-range 172.20.240.0/20 windows-net

# Run Windows container
docker run --name swc-windows -t \
      -e VERSION="${VERSION}" \
      -e RAM_SIZE="${RAM_SIZE}" \
      -e USERNAME="${USERNAME}" \
      -e PASSWORD="${PASSWORD}" \
      -e DISK_SIZE="${DISK_SIZE}" \
      -e CPU_CORES="${CPU_CORES}" \
      --device=/dev/kvm \
      --cap-add NET_ADMIN \
      --stop-timeout 120 \
      -p 8007:8006 \
      -p 3389:3389/tcp \
      -p 3389:3389/udp \
      -v ./data:/data:rw \
      --restart unless-stopped \
      -d dockurr/windows
