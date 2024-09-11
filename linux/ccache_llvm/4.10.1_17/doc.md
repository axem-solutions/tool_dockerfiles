# ccache with llvm
Verson: 4.10.1
https://github.com/ccache/ccache/releases/tag/v4.10.1

## How to build
`docker build -t ccache_llvm:4.10.1_17 .`

## Additional notes
This image is based on the llvm image version 17, because ccache directly calls clang and clang++.