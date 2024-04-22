FROM debian:12

# Install the required packages.
RUN apt update -y && \
    apt install -y wget \
                   debhelper \
                   cmake \
                   pkg-config \
                   libusb-1.0-0-dev \
                   kmod

RUN mkdir -p /lib/modules/$(uname -r)
RUN wget https://github.com/stlink-org/stlink/releases/download/v1.8.0/stlink_1.8.0-1_amd64.deb && \
    dpkg -i stlink_1.8.0-1_amd64.deb && \
    rm stlink_1.8.0-1_amd64.deb && \
    apt remove -y wget

WORKDIR /work