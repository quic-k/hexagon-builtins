#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage ./hexagon-builtins-build.sh <path-to-hexagon-toolchain-install>"
  exit 1
fi

if [ ! -d $1 ]; then
  echo "Error: '$1' is not a directory."
  exit 1
fi

TOOLCHAIN_INSTALL=$(realpath $1)
echo TOOLCHAIN_INSTALL : $TOOLCHAIN_INSTALL
PATH="$TOOLCHAIN_INSTALL/bin/:$PATH" \
                  cmake -G Ninja \
                  -DCMAKE_C_FLAGS="-ffreestanding" \
                  -DCMAKE_CXX_FLAGS="-ffreestanding" \
                  -DCMAKE_BUILD_TYPE=Release \
                  -DLLVM_CMAKE_DIR:PATH=$TOOLCHAIN_INSTALL \
                  -DCMAKE_INSTALL_PREFIX:PATH=$($TOOLCHAIN_INSTALL/bin/clang -print-resource-dir) \
                  -DCMAKE_CROSSCOMPILING:BOOL=ON \
                  -DCOMPILER_RT_OS_DIR=baremetal \
                  -DCAN_TARGET_hexagon=1 \
                  -DCAN_TARGET_x86_64=0 \
                  -DCMAKE_C_COMPILER_FORCED:BOOL=ON \
                  -DCMAKE_CXX_COMPILER_FORCED:BOOL=ON \
                  -C ./hexagon-builtins.cmake \
                  -C ./hexagon-cross.cmake \
                  -B ./ \
                  -S ../compiler-rt

# only build builtins, other parts fail right now
ninja install-builtins
