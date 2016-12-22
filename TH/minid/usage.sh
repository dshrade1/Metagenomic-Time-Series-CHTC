# first concatenate the percent reads mapped

cd mapping_output
cp *.log ../mapping_usage/
cd ../mapping_usage

LOG=*.log
for i in $LOG; do
tail -n 3 "$i" | head -n 1 >> disk.txt
tail -n 2 "$i" | head -n 1 >> memory.txt
tail -n 17 "$i" | head -n 1 >> rss.txt
tail -n 15 "$i" | head -n 1 >> time.txt
done

sort -k4,4nr -k6,6 disk.txt > disk_sorted.txt
rm disk.txt
mv disk_sorted.txt disk.txt

sort -k4,4nr -k6,6nr memory.txt > memory_sorted.txt
rm memory.txt
mv memory_sorted.txt memory.txt

sort -k1,1nr rss.txt > rss_sorted.txt
rm rss.txt
mv rss_sorted.txt rss.txt

sort -k5,5nr -k6,6 -k7,7nr time.txt > time_sorted.txt
rm time.txt
mv time_sorted.txt time.txt

cd ../preprocess_output
cp *.log ../preprocess_usage/
cd ../preprocess_usage

LOG=*.log
for i in $LOG; do
tail -n 3 "$i" | head -n 1 >> disk.txt
tail -n 2 "$i" | head -n 1 >> memory.txt
tail -n 17 "$i" | head -n 1 >> rss.txt
tail -n	15 "$i"	| head -n 1 >> time.txt
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

sort -k5,5nr -k6,6nr -k7,7nr time.txt > time_sorted.txt
rm time.txt
mv time_sorted.txt time.txt
