### Script to build hexagon builtins using upstream toolchain (non linux) without libc

#### Steps

Clone and build upstream toolchain for hexagon (non-linux)

Use following commands:
```
cd /path/to/upstream/llvm-project/
mkdir hexagon-builtins && cd hexagon-builtins
# Copy the 2 script/cmake files
cp /path/to/this/repo/hexagon-* .

./hexagon-builtins-build.sh <path-to-hexagon-install-toolchain>
```
