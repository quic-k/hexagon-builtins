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
                  -DCMAKE_BUILD_TYPE=Release \
                  -DLLVM_CMAKE_DIR:PATH=$TOOLCHAIN_INSTALL \
                  -DCMAKE_INSTALL_PREFIX:PATH=$($TOOLCHAIN_INSTALL/bin/clang -print-resource-dir) \
                  -C ./hexagon-builtins.cmake \
                  -B ./ \
                  -S ../compiler-rt

# only build builtins, other parts fail right now
ninja install-builtins
