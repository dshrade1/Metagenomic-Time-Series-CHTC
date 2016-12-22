#!/bin/bash
# map time series of metagenomic reads to 10% of Mendota coassembly

wget http://proxy.chtc.wisc.edu/SQUID/dgshrader/THcoassembly_100percent.fna.gz
gunzip coassembly_100percent.fna.gz
rm coassembly_100percent.fna.gz

./bbmap_only/bbmap.sh in=$1 ref=THcoassembly_100percent.fna out=./$1.sam t=1
rm coassembly_100percent.fna
