#!/bin/bash

cp /mnt/gluster/dgshrader/MergedReads-TroutBog/fastq/$1 ./

# add Python 2.7 to path, to use instead of system Python (old)
export PATH=$(pwd)/python/bin:$PATH

# convert fastq to fasta
python fastq2fasta.py $1

# length filter
perl removesmalls.pl 150 $1

# unwrap fasta
python FastaMLtoSL.py $1

rm $1
mv $1.out $1

# make a folder for each metagenome
fourletter=${1:0:4}
mkdir ${fourletter}
split -l 140000 $1 ${fourletter}/${fourletter}


# create a read file list (for the mapping step)
python ./list_files.py ${fourletter}
# move read file list to folder of the metagenome
mv readFileList.txt ${fourletter}/

tar -zcvf ${fourletter}.tar.gz ${fourletter}/
rm -r ${fourletter}
rm $1
