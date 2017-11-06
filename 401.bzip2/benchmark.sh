#!/bin/bash

gem5=/usr/local/gem5/build/X86/gem5.opt
SE=/usr/local/gem5/configs/example/se.py
OPTIONS="-I 500000000 --cpu-type=timing --caches --l2cache --l1d_size=128kB --l1i_size=128kB --l2_size=1MB --l1d_assoc=2 --l1i_assoc=2 --l2_assoc=1 --cacheline_size=64"

#cd data

$gem5 -d ./ $SE -c src/benchmark --options='data/input.program 10' $OPTIONS
