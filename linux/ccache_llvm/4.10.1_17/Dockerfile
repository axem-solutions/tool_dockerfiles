# First stage: Download ccache
FROM debian:12 AS builder

ARG CCACHE_VERSION=4.10.1

RUN apt update && \
	apt install -y wget xz-utils

RUN wget -qO- https://github.com/ccache/ccache/releases/download/v${CCACHE_VERSION}/ccache-${CCACHE_VERSION}-linux-x86_64.tar.xz | tar -xJ -C /tmp

# Second stage: Install clang and ccache
FROM axemsolutions/llvm:17

ARG CCACHE_VERSION=4.10.1

COPY --from=builder /tmp/ccache-${CCACHE_VERSION}-linux-x86_64 /opt/ccache

# Create symlinks for clang to use ccache
RUN ln -s /opt/ccache/ccache /usr/local/bin/clang && \
	ln -s /opt/ccache/ccache /usr/local/bin/clang++ && \
	ln -s /opt/ccache/ccache /usr/local/bin/cc && \
	ln -s /opt/ccache/ccache /usr/local/bin/c++

# Ensure ccache is in the PATH
ENV PATH="/opt/ccache:$PATH"