# First stage: Download and build Mull
FROM axemsolutions/llvm:17 AS builder

ARG MULL_VERSION=0.22.0

# Install dependencies to build Mull
RUN apt update && \
	apt install -y libclang-17-dev cmake libsqlite3-dev git

# Download and extract Mull
RUN git clone --branch ${MULL_VERSION} --depth 1 https://github.com/mull-project/mull.git /tmp/mull && \
	cd /tmp/mull && \
	git submodule update --init --recursive

# Build Mull
RUN cd /tmp/mull && \
	mkdir build && \
	cd build && \
	cmake -G "Unix Makefiles" -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_PREFIX_PATH=/usr/lib/llvm-17 -DCMAKE_INSTALL_PREFIX=/usr .. && \
	make && \
	make install

# List contents of /usr/include to verify installation
RUN ls -la /usr/include

# Second stage: Install Mull
FROM axemsolutions/llvm:17

# Copy Mull from the builder stage
COPY --from=builder /usr/bin/mull* /usr/bin/
COPY --from=builder /usr/lib/llvm-17/lib/libmull* /usr/lib/llvm-17/lib/
COPY --from=builder /usr/lib/mull-ir-frontend-17 /usr/lib/mull-ir-frontend-17

# Set environment variables
ENV PATH="$PATH:/usr/lib/llvm-17/bin"
ENV LD_LIBRARY_PATH="/usr/lib/llvm-17/lib:$LD_LIBRARY_PATH"
ENV C_INCLUDE_PATH="/usr/include/llvm-17:$C_INCLUDE_PATH"
ENV CPLUS_INCLUDE_PATH="/usr/include/llvm-17:$CPLUS_INCLUDE_PATH"