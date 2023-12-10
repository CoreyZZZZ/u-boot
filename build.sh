#!/bin/bash

make distclean

ROOT_DIR=`pwd`
export KBUILD_OUTPUT=${ROOT_DIR}/output/

CC=aarch64-linux-gnu-



make ARCH=arm CROSS_COMPILE=${CC} rpi_4_defconfig

if [ ! -d ${ROOT_DIR}/output/ ]; then
    mkdir ${ROOT_DIR}/output
fi

bear -o ${ROOT_DIR}/compile_commands.json  make ARCH=arm CROSS_COMPILE=${CC} -j4

export -n KBUILD_OUTPUT