
# first concatenate the percent reads mapped
mkdir usage
cd run_output
cp *.log ../usage/
cd ../usage

LOG=*.log
for i in $LOG; do
tail -n 3 "$i" | head -n 1 >> disk.txt
tail -n 2 "$i" | head -n 1 >> memory.txt
tail -n 17 "$i" | head -n 1 >> rss.txt
done

sort -k4,4nr -k6,6 disk.txt > disk_sorted.txt
rm disk.txt
mv disk_sorted.txt disk.txt

sort -k4,4nr -k6,6 memory.txt > memory_sorted.txt
rm memory.txt
mv memory_sorted.txt memory.txt

sort -k1,1nr rss.txt > rss_sorted.txt
rm rss.txt
mv rss_sorted.txt rss.txt

