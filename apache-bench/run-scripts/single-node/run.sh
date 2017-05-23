#!/bin/bash
# Author Mohammad Alian <malian2@illinois.edu>
# Sample run script for single node gem5 to run apache-bench
#
# Please make sure that you first run ckpt.sh and also set
# ckpt variable properly

ckpt=$(pwd)/ckptdir/single-node-ab
rundir=$(pwd)/rundir/single-node-ab
diskimage=$M5_PATH/disks/aarch64-ubuntu-trusty-headless.img

kernel=$M5_PATH/binaries/vmlinux.vexpress_gem5_v1_64.20170426

dtb=$M5_PATH/binaries/armv8_gem5_v1_4cpu.20170426.dtb

script=$(pwd)/run-ab.rcS
$debugflag="--debug-flags=WorkItems"

$M5_PATH/build/ARM/gem5.opt $debugflag -d $rundir \
                            $M5_PATH/configs/example/arm/fs_bigLITTLE.py \
                            --cpu-type=atomic \
                            --big-cpus=4 \
                            --little-cpus=0 \
                            --disk=$diskimage \
                            --kernel=$kernel \
                            --dtb=$dtb \
                            --bootscript=$script \
                            --restore-from=$ckpt
