#!/bin/bash

# run this from TroutBogReads
#DATA_DIRS=20160304_failed_merges.txt
#while IFS= read -r line; do
#echo "$line/all_$line.bam"
#IFS=$'\n'
#set -f
#for i in $(cat "20160304_failed_merges.txt"); do
#echo "$i/all_$i.bam"
#samtools merge $i/all_$i.bam $i/*.bam
#done
#done < 20160304_failed_merges.txt

#samtools merge bamfiles/all.bam bamfiles/*.bam
#samtools view -h -o bamfiles/all.sam bamfiles/all.bam
#mv bamfiles/all.sam
##convert all "all"s to "$i"s

DATA_DIRS=*
for i in $DATA_DIRS; do
samtools merge $i/all_$i.bam $i/*.bam
done
