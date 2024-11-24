#!/bin/bash

# Define an array containing the names of Docker containers to restart
containers=(
    "swc-windows"
)

# Iterate over the array and restart each Docker container
for container in "${containers[@]}"; do
    docker restart "$container"
done