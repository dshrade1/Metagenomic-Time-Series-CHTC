#!/bin/bash
# ./postprocess.sh

# make a folder called bam in "map" dir
mkdir TH_bam

# move the bam files to a bam folder
DATA_DIRS=IH*
for i in $DATA_DIRS; do
echo "$i"
mkdir TH_bam/$i
cd $i
mv *.bam ../TH_bam/$i
cd ..
done

DATA_DIRS=H0*
for i in $DATA_DIRS; do
echo "$i"
mkdir TH_bam/$i
cd $i
mv *.bam ../TH_bam/$i
cd ..
done

echo $PWD
cd map

mv TH_bam /mnt/gluster/dgshrader/

for dir in /mnt/gluster/dgshrader/TH_bam/*; do
  echo ${dir##*/} >> ../count/bamDirList.txt
done
