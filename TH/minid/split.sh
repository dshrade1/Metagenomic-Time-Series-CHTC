#!/bin/bash

# split random read file into <20 MB files
mkdir random
split -l 120000 random_MG.fasta random/random

# list split read files (for mapping later)

BEGIN=0.7
INTERVAL=0.01
END=1.0

for a in `seq $BEGIN $INTERVAL $END`; do
DATA_DIRS=random/
for i in $DATA_DIRS; do
DATA_FILES="$i"*
for k in $DATA_FILES; do
echo "${k:7:12}" "$a" >> randomReadFileListNumbers.txt
done
done
done

cd random
mv * ../
