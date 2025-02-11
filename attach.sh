#!/bin/bash

CONTAINER_NAME="rv64_devenv"
IMAGE_NAME="krinkin/rv64-toolchain"

echo "Search: $(docker ps -a -q -f name=^/${CONTAINER_NAME}$)"


# Check if container exists
if [ "$(docker ps -a -q -f name=^/${CONTAINER_NAME}$)" ]; then
    # Container exists, check if it's running
    if [ "$(docker ps -q -f name=^/${CONTAINER_NAME}$)" ]; then
        # Container is running - attach to it
        echo "Attaching to running container..."
        docker attach "${CONTAINER_NAME}"
    else
        # Container exists but stopped - start and attach
        echo "Starting existing container and attaching..."
        docker start -i "${CONTAINER_NAME}"
    fi
else
    # Container doesn't exist - create and run
    echo "Creating and running new container..."
    docker run -it \
        --name "${CONTAINER_NAME}" \
        -v "$(pwd)":/ws \
        --hostname "debug" \
        "${IMAGE_NAME}"
fi
