# First stage: Download and extract the toolchain
FROM debian:bullseye AS builder

RUN apt update -y && \
    apt -y install wget \
                   xz-utils

RUN wget https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi.tar.xz && \
    mkdir -p /opt/gnu/arm-none-eabi-gnu-toolchain-13.2 && \
    tar -xf arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi.tar.xz -C /opt/gnu/arm-none-eabi-gnu-toolchain-13.2 --strip-components=1 && \
    rm arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi.tar.xz

# Second stage: Copy the toolchain from the first stage
FROM debian:bullseye

RUN apt update -y && \
    apt -y install gdb \
                   make

COPY --from=builder /opt/gnu /opt/gnu

WORKDIR /work

ENV PATH="/opt/gnu/arm-none-eabi-gnu-toolchain-13.2/bin:${PATH}"
