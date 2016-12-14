#!/bin/bash

######### Functional ############################################

# 1. Import fastq file
echo "Importing fastq file..."
cp /mnt/gluster/dgshrader/MergedReads-TroutBog/fastq/$1 ./

# 2. Add Python 2.7 to path, to use instead of system Python (old)
echo "Selecting python 2.7... "
export PATH=$(pwd)/python/bin:$PATH
which python

# 3. Convert fastq to fasta
echo "Converting fastq to fasta..."
python fastq2fasta.py $1
rm $1

# 4. Unwrap fasta
echo "Unwrapping fasta..."
python FastaMLtoSL.py $1.fasta
rm $1.fasta
mv $1.fasta.out $1.fasta

# 5. Length-filter
echo "Removing small (<150 bp) sequences..."
perl removesmalls.pl 150 $1.fasta > $1.fasta.out
rm $1.fasta
#################################################################

# make a folder for each metagenome
echo "Making folder of split reads for metagenome..."
elevenletter=${1:0:11}
mkdir ${elevenletter}
split -l 120000 $1.fasta.out ${elevenletter}/${elevenletter}
rm $1.fasta.out

# create a read file list (for the mapping step)
echo "Listing files..."
python ./list_files.py ${elevenletter}

# move read file list to folder of the metagenome
mv readFileList.txt ${elevenletter}/

echo "Tarring directory of split fasta files..."
tar -zcvf ${elevenletter}.tar.gz ${elevenletter}/
rm -r ${elevenletter}
