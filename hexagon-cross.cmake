
set(CMAKE_SYSTEM_NAME Linux CACHE STRING "")
set(CMAKE_C_COMPILER_TARGET hexagon-unknown-unknown-elf CACHE STRING "")
set(CMAKE_CXX_COMPILER_TARGET hexagon-unknown-unknown-elf CACHE STRING "")

set(CMAKE_C_COMPILER clang CACHE STRING "")
set(CMAKE_SIZEOF_VOID_P 4 CACHE STRING "")
set(CMAKE_CXX_COMPILER clang++ CACHE STRING "")
set(CMAKE_ASM_COMPILER clang CACHE STRING "")
set(CMAKE_OBJCOPY objcopy CACHE STRING "")
set(CMAKE_C_COMPILER_RANLIB ranlib CACHE STRING "")
set(CMAKE_CROSSCOMPILING_EMULATOR qemu-system-hexagon CACHE STRING "")
set(CMAKE_CXX_COMPILER_FORCED ON CACHE BOOL "")

# llvm-project/runtimes/ depends on these features because
# of `llvm-libc-common-utilities` in runtimes/cmake/Modules/FindLibcCommonUtils.cmake:
set(CMAKE_CXX_COMPILE_FEATURES cxx_std_17;cxx_std_14;cxx_std_11;cxx_std_03;cxx_std_98 CACHE STRING "")

