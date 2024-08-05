# Frist stage: Download the gpg keyring
FROM debian:12 AS builder

RUN apt update && \
    apt install -y wget \
                   gnupg

RUN wget -qO - https://apt.llvm.org/llvm-snapshot.gpg.key | gpg --dearmor -o /tmp/llvm-snapshot-keyring.gpg

# Second stage: Install clang
FROM debian:12

ARG CLANG_VERSION=17

COPY --from=builder /tmp/llvm-snapshot-keyring.gpg /usr/share/keyrings/llvm-snapshot-keyring.gpg

RUN apt update && \
    apt install -y ca-certificates

# Add the LLVM repository
RUN VERSION_CODENAME=$(grep VERSION_CODENAME /etc/os-release | cut -d= -f2) && \
    echo "deb [signed-by=/usr/share/keyrings/llvm-snapshot-keyring.gpg] https://apt.llvm.org/${VERSION_CODENAME}/ llvm-toolchain-${VERSION_CODENAME}-${CLANG_VERSION} main" > /etc/apt/sources.list.d/llvm.list

RUN apt update && \
    apt install -y clang-${CLANG_VERSION} \
                   lldb-${CLANG_VERSION} \
                   lld-${CLANG_VERSION} && \
    rm -rf /var/lib/apt/lists/*

ENV PATH="$PATH:/usr/lib/llvm-${CLANG_VERSION}/bin"
