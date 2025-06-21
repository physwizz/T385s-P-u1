#!/bin/bash


OUT_DIR=out

# you should change the "CROSS_COMPILE" to right toolchain path (you downloaded)
# ex)CROSS_COMPILE={android platform directory you downloaded}/android/prebuilt/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-

# CROSS_COMPILE=/home/physwizz/toolchains/arm-linux-androideabi-5.1-master/bin/arm-linux-androideabi-

# CROSS_COMPILE=/home/physwizz/toolchains/android_prebuilts_gcc_linux-x86_arm_arm-linux-androideabi-4.9-lineage-19.1/bin/arm-linux-androideabi-

# COMMON_ARGS="-C $(pwd) O=$(pwd)/${OUT_DIR} ARCH=arm CROSS_COMPILE=arm-linux-androideabi- KCFLAGS=-mno-android"

# export PATH=$(pwd)/../PLATFORM/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin:$PATH

COMMON_ARGS="-C $(pwd) O=$(pwd)/${OUT_DIR} ARCH=arm CROSS_COMPILE=arm-linux-androideabi- KCFLAGS=-mno-android"

export PATH=/home/physwizz/toolchains/android_prebuilts_gcc_linux-x86_arm_arm-linux-androideabi-4.9-lineage-19.1/bin:$PATH
export ARCH=arm

[ -d ${OUT_DIR} ] && rm -rf ${OUT_DIR}
mkdir ${OUT_DIR}

make ${COMMON_ARGS} gta2slte_kor_skt_defconfig
make ${COMMON_ARGS}

cp ${OUT_DIR}/arch/arm/boot/zImage $(pwd)/arch/arm/boot/zImage
