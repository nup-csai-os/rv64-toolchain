# RISC-V Development Environment

This project provides a containerized development environment for RISC-V development. It uses Docker to create an isolated environment with all necessary tools and dependencies pre-installed.

## Prerequisites

- Docker installed and running on your system
- Basic understanding of Docker commands
- Bash shell environment

## Quick Start

1. Clone this repository
2. Build the local Docker image (optional, if you want to customize the environment):
   ```bash
   ./build_local_image.sh
   ```
3. Start the development environment:
   ```bash
   ./attach.sh
   ```

## Available Scripts

### `attach.sh`
Main script to manage the development container. It will:
- Create and start a new container if none exists
- Start an existing container if it's stopped
- Attach to a running container if it's already running

The container is configured with:
- Volume mount of the current directory to `/ws` in the container
- Custom hostname "debug"
- Interactive terminal session

### `newterm.sh`
Opens a new terminal session in the running container. Useful when you need multiple terminal windows for development tasks.

### `purge_containers.sh`
Removes all development containers created by this environment. Use this when you want to start fresh or clean up resources.

### `build_local_image.sh`
Builds the local Docker image with the RISC-V toolchain and development tools. The image is tagged as `krinkin/rv64-toolchain:latest`.

### `env.sh`
Contains environment variables used by all scripts:
- `CONTAINER_NAME`: Name of the development container (default: "rv64_devenv")
- `IMAGE_NAME`: Docker image name (default: "krinkin/rv64-toolchain:latest")

## Container Management

The environment uses consistent container naming to ensure all scripts work together:
- Container name is fixed to "rv64_devenv"
- Working directory is mounted as `/ws`
- Container hostname is set to "debug"

## Best Practices

1. Use `attach.sh` for your primary development session
2. Use `newterm.sh` when you need additional terminals
3. Keep your work in the mounted volume (`/ws`) to persist changes
4. Use `purge_containers.sh` if you need to reset the environment

