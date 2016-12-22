#!/bin/bash

cp /mnt/gluster/dgshrader/MergedReads-TroutBog/$1 ./

# add Python 2.7 to path, to use instead of system Python (old)
export PATH=$(pwd)/python/bin:$PATH
# unwrap fasta
python FastaMLtoSL.py $1

rm $1
mv $1.out $1

# make a folder for each metagenome
code=`echo "$1" | cut -d'.' -f1`
mkdir ${code}
split -l 140000 $1 ${code}/${code}


# create a read file list (for the mapping step)
python ./list_files.py ${code}
# move read file list to folder of the metagenome
mv readFileList.txt ${code}/



tar -zcvf ${code}.tar.gz ${code}/
rm -r ${code}
rm $1
