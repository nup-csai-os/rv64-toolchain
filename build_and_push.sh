#!/bin/bash
set -e

IMAGE="krinkin/rv64-toolchain:latest"
PLATFORMS="linux/amd64,linux/arm64"

# Ensure buildx builder exists
if ! docker buildx inspect multiarch > /dev/null 2>&1; then
    docker buildx create --name multiarch --use
else
    docker buildx use multiarch
fi

docker buildx build \
    --platform "$PLATFORMS" \
    --tag "$IMAGE" \
    --push \
    .
