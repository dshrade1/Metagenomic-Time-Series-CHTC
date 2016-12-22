DATA_DIRS=*/
for i in $DATA_DIRS; do
cd $i
du -bsx *.bam  >> ~/TroutBogReads/bamfilesizes8.txt
cd ..
done
