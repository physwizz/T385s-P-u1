#!/bin/bash


OUT_DIR=out

# you should change the "CROSS_COMPILE" to right toolchain path (you downloaded)
# ex)CROSS_COMPILE={android platform directory you downloaded}/android/prebuilt/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
# export CROSS_COMPILE=/home/physwizz/toolchains/arm-linux-androideabi-5.1-master/bin/arm-linux-androideabi-


COMMON_ARGS="-C $(pwd) O=$(pwd)/${OUT_DIR} ARCH=arm CROSS_COMPILE=/toolchain/arm-linux-androideabi-5.1-master/bin/arm-linux-androideabi- KCFLAGS=-mno-android"

export PATH=$(pwd)/toolchain/arm-linux-androideabi-5.1-master/bin:$PATH
export ARCH=arm

[ -d ${OUT_DIR} ] && rm -rf ${OUT_DIR}
mkdir ${OUT_DIR}

make ${COMMON_ARGS} gta2slte_kor_skt_defconfig
make -j64 ${COMMON_ARGS}

cp ${OUT_DIR}/arch/arm/boot/zImage $(pwd)/arch/arm/boot/zImage
