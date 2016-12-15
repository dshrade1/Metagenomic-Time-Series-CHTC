#!/bin/bash
# ./postprocess.sh

# make a folder called TE_bam in "map" dir
mkdir TE_bam

# move the bam files to a bam folder
DATA_DIRS=IH*
for i in $DATA_DIRS; do
echo "$i"
mkdir TE_bam/$i
cd $i
mv *.bam ../TE_bam/$i
cd ..
done

# echo $PWD
# cd map

mv TE_bam /mnt/gluster/dgshrader/

for dir in /mnt/gluster/dgshrader/TE_bam/*; do
  echo ${dir##*/} >> ../count/bamDirList.txt
done
