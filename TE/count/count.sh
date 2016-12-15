#!/bin/bash
# script is based on directories in bamDirList.txt

# use samtools 1.3 rather than default
export PATH=$(pwd)/samtools-1.3:$PATH

#merge the bam files for each metagenome
echo "Merging bam file" $1 "..."
samtools merge $1.bam /mnt/gluster/dgshrader/TE_bam/$1/*

# sort bam
echo "Sorting bam file" $1 "..."
# input is a non-human-readable bam file
# the following produces 151M sorted_all_IHPI.bam output from 49M .bam input
# output is a 3-column list with a 1-line header @HD    VN:1.3  SO:queryname

samtools sort -l 0 -n -m 6G -O sam -o sorted_$1.sam $1.bam

# the following produces 213M sorted_all_IHPI.bam output from 49M .bam input
# output is a 3-column list with 1-line header ?BC#???BAM??i@HD VN:1.3  SO:queryname
# samtools sort -l 0 -n -m 6G -o sorted_$1 $1

rm $1.bam

# wget http://proxy.chtc.wisc.edu/SQUID/dgshrader/python.tar.gz
# tar -xvzf python.tar.gz
# rm python.tar.gz

export PATH=$(pwd)/python/bin:$PATH

python -m pip install HTSeq

echo "Counting reads in" $1 "..."
htseq-count -f sam -r name -s no -a 0 -t CDS -i locus_tag -m intersection-strict sorted_$1.sam /mnt/gluster/dgshrader/3300000439.gff > CDS_$1.count
htseq-count -f sam -r name -s no -a 0 -t tRNA -i locus_tag -m intersection-strict sorted_$1.sam /mnt/gluster/dgshrader/3300000439.gff > tRNA_$1.count
htseq-count -f sam -r name -s no -a 0 -t rRNA -i locus_tag -m intersection-strict sorted_$1.sam /mnt/gluster/dgshrader/3300000439.gff > rRNA_$1.count
htseq-count -f sam -r name -s no -a 0 -t repeat_region -i locus_tag -m intersection-strict sorted_$1.sam /mnt/gluster/dgshrader/3300000439.gff > rr_$1.count

rm sorted_$1.sam
