# RISC-V Development Environment

This project provides a containerized development environment for RISC-V development. It uses Docker to create an isolated environment with all necessary tools and dependencies pre-installed.

## Prerequisites

- Docker installed and running on your system

## Quick Start


- {HOST} Clone this repository
```
git clone git@github.com:krinkin/rv64-toolchain.git
```
- {HOST} Clone xv6 vanilla repository
```
cd rv64-toolchain
git clone git@github.com:nup-csai-os/xv6-riscv.git
```
- {HOST} Build the local Docker image (optional, you can get it from hub.docker.com):
  ```bash
   ./build_local_image.sh
   ```
- {HOST} Start the development environment:
```bash
   ./attach.sh
   ```
- [RV64@ debug 1st terminal] Build xv6 and launch it for debug
```bash
   cd xv6-riscv
   make qemu-gdb
   ```
- {HOST} Create one more terminal and enter into container
```
./newterm.sh
```
- [RV64@ debug 2nd terminal] run kernel with gdb
```bash
   cd xv6-riscv 
   gdb-multiarch kernel/kernel
   
   (gdb) target remote localhost:25000
   b *0x80000000
   c
```
It should be stopped with
```
Thread 2 hit Breakpoint 1, 0x0000000080000000 in _entry ()
(gdb)
```

If you see the previous message, everything is set up

To stop running OS, press Ctrl-A X

Screencast: 

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

## Refs
- [XV6 RICS-V Textbook](https://pdos.csail.mit.edu/6.828/2023/xv6/book-riscv-rev3.pdf)
- [Video course](https://www.youtube.com/watch?v=fWUJKH0RNFE&list=PLbtzT1TYeoMhTPzyTZboW_j7TPAnjv9XB)
