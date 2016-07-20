#!/bin/bash

# functional script

# move *.tar.gz files to ../map
# change "cp" to "mv" after testing this script
mv *.tar.gz ../map

# move yourself to ../map

cd ../map

# untar fasta folders

ls *.tar.gz | xargs -i tar xzvf {}

# remove tar balls
rm *.tar.gz

# create a concatenated readFileList.txt

for dir in IH*
do 
while read line	
do 
echo $dir $line >> readFileList.txt
done < $dir/readFileList.txt
rm $dir/readFileList.txt
done

for dir in H0*
do
while read line
do
echo $dir $line >> readFileList.txt
done < $dir/readFileList.txt
rm $dir/readFileList.txt
done


