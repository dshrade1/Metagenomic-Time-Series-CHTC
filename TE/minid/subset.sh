#!/bin/bash

# 1. Copy a single TE metagenome read file from gluster to this dir

cp /mnt/gluster/dgshrader/MergedReads-TroutBog/$1 ./

# 2. Unwrap fasta
# add Python 2.7 to path, to use instead of system Python (old)
export PATH=$(pwd)/python/bin:$PATH
# unwrap fasta
python FastaMLtoSL.py $1
rm $1

# 3. Subsample fasta
python subsampler.py $1.out 0.02 > sub_$1
rm $1.out
