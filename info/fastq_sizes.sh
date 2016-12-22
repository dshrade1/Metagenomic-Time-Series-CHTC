# /fastq_sizes.sh TH_fastq_ID.txt

while read i
do
du -bsx /mnt/gluster/dgshrader/MergedReads-TroutBog/fastq/$i >> fastq_sizes.txt
done < $1

sort -k1,1nr -k2,2 fastq_sizes.txt > fastq_sizes_sorted.txt
rm fastq_sizes.txt
mv fastq_sizes_sorted.txt fastq_sizes.txt
