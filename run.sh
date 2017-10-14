#!/bin/bash

gem5=/usr/local/gem5/build/X86/gem5.opt
OUT=/mnt
SE=/usr/local/gem5/configs/example/se.py
OPTIONS="-I 500000000 --cpu-type=TimingSimpleCPU --caches --l2cache --l1d_size=$3kB --l1i_size=$1kB --l2_size=$5MB --l1d_assoc=$4 --l1i_assoc=$2 --l2_assoc=$6 --cacheline_size=$7"

benchmark=( 401.bzip2 429.mcf 456.hmmer 458.sjeng 470.lbm )
benchmark_opts=(
	'401.bzip2/data/input.program 10'
	'429.mcf/data/inp.in'
	'--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 456.hmmer/data/bombesin.hmm'
	'458.sjeng/data/test.txt'
	'20 470.lbm/reference.dat 0 1 470.lbm/data/100_100_130_cf_a.of'
)

mkdir -p $OUT
echo $OPTIONS > $OUT/config

for i in {0..4}; do
	b=${benchmark[$i]}
	opt=${benchmark_opts[$i]}
	$gem5 -d $OUT/$b $SE -c $b/src/benchmark --options="$opt" $OPTIONS
done
