FROM debian:latest

WORKDIR /work

RUN apt update
RUN apt -y install  wget \
                    make \
                    xz-utils

# Install cmake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.26.3/cmake-3.26.3-Linux-x86_64.sh \
    -q -O /tmp/cmake-install.sh \
    && chmod u+x /tmp/cmake-install.sh \
    && mkdir /opt/cmake \
    && /tmp/cmake-install.sh --skip-license --prefix=/opt/cmake \
    && rm /tmp/cmake-install.sh

# Install GNU arm-none-eabi toolchain
RUN wget https://developer.arm.com/-/media/Files/downloads/gnu/12.2.mpacbti-rel1/binrel/arm-gnu-toolchain-12.2.mpacbti-rel1-x86_64-arm-none-eabi.tar.xz \
    -q -O /tmp/arm-gnu-toolchain-12.2.mpacbti-rel1-x86_64-arm-none-eabi.tar.xz \
    && mkdir /opt/gnu \
    && tar -xf /tmp/arm-gnu-toolchain-12.2.mpacbti-rel1-x86_64-arm-none-eabi.tar.xz \
    -C /tmp \
    && mv /tmp/arm-gnu-toolchain-12.2.mpacbti-rel1-x86_64-arm-none-eabi /opt/gnu/arm-none-eabi-gnu-toolchain-12.2 \
    && rm /tmp/arm-gnu-toolchain-12.2.mpacbti-rel1-x86_64-arm-none-eabi.tar.xz

ENV PATH="/opt/cmake/bin:/opt/gnu/arm-none-eabi-gnu-toolchain-12.2/bin:${PATH}"
