# First stage: Download and extract the toolchain
FROM debian:bullseye AS builder

RUN apt update -y && \
    apt -y install wget \
                   bzip2

RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 && \
    mkdir -p /opt/gnu/arm-none-eabi-gnu-toolchain-10.3 && \
    tar -xjf gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 -C /opt/gnu/arm-none-eabi-gnu-toolchain-10.3 --strip-components=1 && \
    rm gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 

# Second stage: Copy the toolchain from the first stage
FROM debian:bullseye

RUN apt update -y && \
    apt -y install gdb \
                   make

COPY --from=builder /opt/gnu /opt/gnu

WORKDIR /work

ENV PATH="/opt/gnu/arm-none-eabi-gnu-toolchain-10.3/bin:${PATH}"
