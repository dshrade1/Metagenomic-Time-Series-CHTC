DATA_DIRS=*/
for i in $DATA_DIRS; do
cd $i
echo $i >> ~/TroutBogReads/doesbamequalerr.txt
ls -l *.bam| wc -l >> ~/TroutBogReads/doesbamequalerr.txt
ls -k *.err| wc -l >> ~/TroutBogReads/doesbamequalerr.txt
#du -bsx * | sort -rh | head -1 >> ~/TroutBogReads/maxfilesizes.txt
cd ..
done

