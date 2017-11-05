#!/bin/bash

for dir in *; do
    if  [ ! -d ${dir} ]; then
        continue
    fi
    echo $dir
    catch=$(grep --color=never "sim_insts\|overall_misses::total" $dir/stats.txt)
    awk '{if ($1 == "sim_insts") inst = $2;
          else if ($1 ~ /icache/) imiss = $2;
          else if ($1 ~ /dcache/) dmiss = $2;
          else if ($1 ~/l2/) l2miss = $2;}
         END {
           print "Insts / Misses"
           print "  Insts:\tICache\tDCache\tL2Cache";
           printf "  %s\t%s\t%s\t%s\n", inst, imiss, dmiss, l2miss;
         }' <<< "$catch"
    echo '--------------------------'
done
