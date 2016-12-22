DATA_DIRS=*/
for i in $DATA_DIRS; do
cd $i
du -bsx * | sort -rh | head -1 >> ~/TroutBogReads/maxfilesizes.txt
cd ..
done

