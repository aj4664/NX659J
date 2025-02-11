#! /bin/bash
#env
export ARCH=arm64
export SUBARCH=arm64
export PATH="/root/Toolchain/clang-r416183/bin:/root/Toolchain/gcc64/bin:/root/Toolchain/gcc32/bin:$PATH"

args="-j$(nproc --all) \
ARCH=arm64 \
SUBARCH=arm64 \
O=out \
CC=clang \
CROSS_COMPILE=aarch64-linux-android- \
CROSS_COMPILE_ARM32=arm-linux-androideabi- \
CLANG_TRIPLE=aarch64-linux-gnu- "

#clean


#build
make ${args} CC="ccache clang" HOSTCC="ccache gcc" HOSTCXX="ccache g++" vendor/mokee_nx659j_defconfig
make ${args} CC="ccache clang" HOSTCC="ccache gcc" HOSTCXX="ccache g++" 2>&1 | tee kernel.log

