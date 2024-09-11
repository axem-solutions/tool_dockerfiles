# First stage: Download, extract and build cpputest
FROM debian:12 AS builder

# Use these arguments to control the number of processors used by the build.
ARG SPARE_PROCESSORS=0
RUN WORKER_PROCESSORS=$(($(nproc) - ${SPARE_PROCESSORS})) && \
    echo "Number of worker processors: ${WORKER_PROCESSORS}"

ARG CPPUTEST_VERSION=4.0

# Install the required packages.
RUN apt update -y && \ 
    apt -y install g++ \
                   cmake \
                   libtool \
                   autoconf \
                   wget

RUN wget "https://github.com/cpputest/cpputest/archive/refs/tags/v${CPPUTEST_VERSION}.tar.gz" && \
    tar -xzf v${CPPUTEST_VERSION}.tar.gz -C /tmp && \
    cd /tmp/cpputest-${CPPUTEST_VERSION} && \
    autoreconf . -i && \
    ./configure && \
    make tdd -j$(WORKER_PROCESSORS)

# Second stage: Copy cpputest from the first stage
FROM debian:12

ARG CPPUTEST_VERSION=4.0

COPY --from=builder /tmp/cpputest-${CPPUTEST_VERSION} /opt/cpputest

ENV CPPUTEST_HOME=/opt/cpputest

WORKDIR /work