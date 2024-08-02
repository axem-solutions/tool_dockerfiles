# First stage: Download and extract xwin
FROM debian:12 AS builder

ARG XWIN_VERSION=0.6.2

RUN apt update -y && \
    apt -y install wget \
                   ca-certificates

RUN wget "https://github.com/Jake-Shadle/xwin/releases/download/${XWIN_VERSION}/xwin-${XWIN_VERSION}-$(uname -m)-unknown-linux-musl.tar.gz" && \
    tar -xzf xwin-${XWIN_VERSION}-$(uname -m)-unknown-linux-musl.tar.gz --strip-components=1 -C /tmp

# Second stage: Copy xwin from the first stage
FROM debian:12

COPY --from=builder /tmp /opt/xwin

ENV PATH="${PATH}:/opt/xwin"