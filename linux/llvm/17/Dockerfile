# First stage: Install LLVM
FROM debian:12

ARG CLANG_VERSION=17

# Install necessary packages for installation
RUN apt update && \
    apt install -y wget \
                   gnupg \
                   ca-certificates \
                   lsb-release \
                   software-properties-common

# Download and install LLVM
RUN wget -q -P /tmp/ https://apt.llvm.org/llvm.sh && \
    chmod +x /tmp/llvm.sh && \
    /tmp/llvm.sh ${CLANG_VERSION} && \
    rm /tmp/llvm.sh

# Install additional dependencies required for LLVM and Clang
RUN apt update && \
    apt install -y libffi-dev \
                   libxml2-dev \
                   libtinfo-dev \
                   zlib1g-dev \
                   libedit-dev \
                   libcurl4-openssl-dev

# Clean up unnecessary files and packages
RUN apt-get remove --purge -y wget \
                              gnupg \
                              lsb-release \
                              software-properties-common && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set environment variables
ENV PATH="$PATH:/usr/lib/llvm-${CLANG_VERSION}/bin"
ENV LD_LIBRARY_PATH="/usr/lib/llvm-${CLANG_VERSION}/lib:$LD_LIBRARY_PATH"
ENV C_INCLUDE_PATH="/usr/include/llvm-${CLANG_VERSION}:$C_INCLUDE_PATH"
ENV CPLUS_INCLUDE_PATH="/usr/include/llvm-${CLANG_VERSION}:$CPLUS_INCLUDE_PATH"