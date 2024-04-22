# First stage: Download and extract the toolchain and Python
FROM debian:12 AS builder

RUN apt update -y && \
    apt -y install wget \
                   xz-utils \
                   build-essential \
                   libffi-dev \
                   libssl-dev \
                   zlib1g-dev \
                   libncurses5-dev \
                   libncursesw5-dev \
                   libreadline-dev \
                   libsqlite3-dev \
                   libgdbm-dev \
                   libdb5.3-dev \
                   libbz2-dev \
                   libexpat1-dev \
                   liblzma-dev \
                   tk-dev \
                   curl

# Download the toolchain
RUN wget https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi.tar.xz && \
    mkdir -p /opt/gnu/arm-none-eabi-gnu-toolchain-13.2 && \
    tar -xf arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi.tar.xz -C /opt/gnu/arm-none-eabi-gnu-toolchain-13.2 --strip-components=1 && \
    rm arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-eabi.tar.xz

# Download, build and install Python 3.8.9
RUN curl -O https://www.python.org/ftp/python/3.8.9/Python-3.8.9.tar.xz && \
    tar -xf Python-3.8.9.tar.xz && \
    cd Python-3.8.9 && \
    ./configure --enable-optimizations && \
    make -j$(nproc) && \
    make altinstall

# Second stage: Copy the toolchain and Python from the first stage
FROM debian:12

RUN apt update -y && \
    apt -y install gdb \
                   make \
                   libncurses5 \
                   libncursesw5

COPY --from=builder /opt/gnu /opt/gnu
COPY --from=builder /usr/local/bin/python3.8 /usr/local/bin/python3.8
COPY --from=builder /usr/local/lib/python3.8 /usr/local/lib/python3.8

WORKDIR /work

ENV PATH="/opt/gnu/arm-none-eabi-gnu-toolchain-13.2/bin:${PATH}"
