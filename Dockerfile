# Use Debian slim as base image for minimal size
FROM debian:bookworm-slim

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install RISC-V toolchain and essential packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc-riscv64-linux-gnu \
    g++-riscv64-linux-gnu \
    binutils-riscv64-linux-gnu \
    gdb-multiarch \
    qemu-user \
    qemu-system-riscv64 \
    gdb-multiarch \
    make \
    build-essential \
    cmake 

RUN apt-get install -y bsdextrautils \
    file \
    binutils \
    vim \
    less \
    vim htop git net-tools binutils psmisc tmux 

RUN   rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Create a directory for user projects
WORKDIR /ws

# Add example test program to verify toolchain
COPY test.c /ws/
COPY bashrc /root/.bashrc
RUN riscv64-linux-gnu-gcc -static /ws/test.c &&  qemu-riscv64 ./a.out

# Default command
CMD ["/bin/bash"]
