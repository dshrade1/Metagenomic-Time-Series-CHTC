# /fasta_sizes.sh TH_fasta_ID.txt

while read i
do
du -bsx /mnt/gluster/dgshrader/MergedReads-TroutBog/$i >> fasta_sizes.txt
done < $1

sort -k1,1nr -k2,2 fasta_sizes.txt > fasta_sizes_sorted.txt
rm fasta_sizes.txt
mv fasta_sizes_sorted.txt fasta_sizes.txt
