FROM debian:bullseye

# Install the required packages.
RUN apt update -y && \
    apt install -y wget \
                   debhelper \
                   cmake \
                   pkg-config \
                   libusb-1.0-0-dev \
                   kmod

RUN mkdir -p /lib/modules/$(uname -r)
RUN wget https://github.com/stlink-org/stlink/releases/download/v1.6.1/stlink-1.6.1-1_amd64.deb && \
    dpkg -i stlink-1.6.1-1_amd64.deb && \
    rm stlink-1.6.1-1_amd64.deb && \
    apt remove -y wget

WORKDIR /work