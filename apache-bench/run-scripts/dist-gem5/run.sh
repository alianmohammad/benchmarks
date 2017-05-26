#!/bin/bash
# Author Mohammad Alian <malian2@illinois.edu>
# Sample run script for single dist-gem5 to run apache-bench
#
# Please make sure that you first run ckpt.sh and also set
# ckpt variable properly

fsconfig=$M5_PATH/configs/example/arm/dist_bigLITTLE.py
swconfig=$M5_PATH/configs/example/arm/dist_bigLITTLE.py
m5exe=$M5_PATH/build/ARM/gem5.opt
ckptdir=$(pwd)/ckptdir/multi-node-ab
rundir=$ckptdir
diskimage=$M5_PATH/disks/aarch64-ubuntu-trusty-headless.img
kernel=$M5_PATH/binaries/vmlinux.vexpress_gem5_v1_64.20170426
dtb=$M5_PATH/binaries/armv8_gem5_v1_4cpu.20170426.dtb
script=$(pwd)/boot-ab.rcS
nnodes=4
debugflags="--debug-flags=DistEthernet,WorkItems"

$M5_PATH/util/dist/gem5-dist.sh -n $nnodes \
                                -x $m5exe \
                                -s $swconfig \
                                -f $fsconfig \
                                -r $rundir \
                                -c $ckptdir \
                                --m5-args \
                                    $debugflags \
                                --fs-args \
                                    --cpu-type=atomic \
                                    --big-cpus=4 \
                                    --little-cpus=0 \
                                    --disk=$diskimage \
                                    --kernel=$kernel \
                                    --dtb=$dtb \
                                    --bootscript=$script \
                                --cf-args \
                                    --dist-sync-start=1000000000000t
                                    --restore-from=<ckpt number>
