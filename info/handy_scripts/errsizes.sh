# move to your directory of choice (e.g., map) to run.
# this will tell you the sizes of the error files so you can see if anything is abnormal

DATA_DIRS=*/
for i in $DATA_DIRS; do
cd $i
du -bsx *.err >>  ../errsizes_bytes.txt
cd ..
done

sort -k1,1nr -k2,2 errsizes_bytes.txt > errsizes_bytes_sorted.txt
rm errsizes_bytes.txt
mv errsizes_bytes_sorted.txt errsizes_bytes.txt

