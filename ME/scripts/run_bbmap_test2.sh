#!/bin/bash
# map time series of metagenomic reads to 10% of Mendota coassembly

wget http://proxy.chtc.wisc.edu/SQUID/dgshrader/coassembly_20percent.fna.gz
gunzip coassembly_20percent.fna.gz
rm coassembly_20percent.fna.gz

./bbmap_only/bbmap.sh in=$1 ref=coassembly_20percent.fna out=./$1.sam t=1
rm coassembly_20percent.fna

