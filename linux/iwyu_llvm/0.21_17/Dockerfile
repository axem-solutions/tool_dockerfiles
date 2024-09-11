# First stage: Download and build IWYU
FROM axemsolutions/llvm:17 AS builder

# Use these arguments to control the number of processors used by the build.
ARG SPARE_PROCESSORS=0
RUN WORKER_PROCESSORS=$(($(nproc) - ${SPARE_PROCESSORS})) && \
    echo "Number of worker processors: ${WORKER_PROCESSORS}"

ARG IWYU_VERSION=0.21

# Install dependencies for IWYU
RUN apt update && \
	apt install -y cmake git libclang-17-dev

# Download and build IWYU
RUN git clone --branch ${IWYU_VERSION} https://github.com/include-what-you-use/include-what-you-use.git /tmp/iwyu && \
	cd /tmp/iwyu && \
	mkdir build && \
	cd build && \
	cmake -G "Unix Makefiles" -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_PREFIX_PATH=/usr/lib/llvm-17 -DCMAKE_INSTALL_PREFIX=/usr .. && \
	make -j$(WORKER_PROCESSORS) && \
	make install

# Second stage: Install clang and IWYU
FROM axemsolutions/llvm:17

# Copy IWYU from the builder stage
COPY --from=builder /usr/bin/include-what-you-use /usr/bin/include-what-you-use
COPY --from=builder /usr/lib/llvm-17/lib/libiwyu.* /usr/lib/llvm-17/lib/