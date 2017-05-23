#!/bin/bash
# Author Mohammad Alian <malian2@illinois.edu>
# Sample ckpt script for single node gem5 to run apache-bench
#
# Please check http://publish.illinois.edu/icsl-pdgem5/benchmarks/
# to prepare the disk-image

rundir=$(pwd)/ckptdir/single-node-ab
diskimage=$M5_PATH/disks/aarch64-ubuntu-trusty-headless.img
diskimage=/home/malian2/disk/memcached.apache.aarch64.img
kernel=$M5_PATH/binaries/vmlinux.vexpress_gem5_v1_64.20170426
dtb=$M5_PATH/binaries/armv8_gem5_v1_4cpu.20170426.dtb
script=$(pwd)/boot-ab.rcS

$M5_PATH/build/ARM/gem5.opt -d $rundir \
                            $M5_PATH/configs/example/arm/fs_bigLITTLE.py \
                            --cpu-type=atomic \
                            --big-cpus=4 \
                            --little-cpus=0 \
                            --disk=$diskimage \
                            --kernel=$kernel \
                            --dtb=$dtb \
                            --bootscript=$script \
