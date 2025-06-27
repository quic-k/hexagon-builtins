### Script to build hexagon builtins using upstream toolchain (non linux)

#### Steps

Clone and build upstream toolchain for hexagon (non-linux)

Use following commands:
```
cd /path/to/upstream/llvm-project/
mkdir hexagon-builtins && cd hexagon-builtins
# Copy the 3 script/cmake files
cp /path/to/this/repo/hexagon-* .

./build-hexagon-builtins.sh <path-to-hexagon-install-toolchain>
```
