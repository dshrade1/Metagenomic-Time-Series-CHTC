#!/bin/bash
wget http://proxy.chtc.wisc.edu/SQUID/dgshrader/TEcoassembly_100percent.fna.gz
gunzip TEcoassembly_100percent.fna.gz
# ./bbmap_only/bbmap.sh -Xmx6g in=$1 ref=TEcoassembly_100percent.fna out=./$1.bam t=1 sam=1.3 minid=$2
./bbmap_only/bbmap.sh -Xmx6g in=$1 ref=TEcoassembly_100percent.fna out=./$1.bam t=1 sam=1.3 minid=0.92
rm TEcoassembly_100percent.fna
