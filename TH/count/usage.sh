
# first concatenate the percent reads mapped

mkdir usage92

cp *.log usage92

cd usage92

LOG=*.log
for i in $LOG; do
tail -n 3 "$i" | head -n 1 >> disk92.txt
tail -n 2 "$i" | head -n 1 >> memory92.txt
tail -n 17 "$i" | head -n 1 >> rss92.txt
done

sort -k4,4nr -k6,6 disk92.txt > disk92_sorted.txt
rm disk92.txt
mv disk92_sorted.txt disk92.txt

sort -k4,4nr -k6,6 memory92.txt > memory92_sorted.txt
rm memory92.txt
mv memory92_sorted.txt memory92.txt

sort -k1,1nr rss92.txt > rss92_sorted.txt
rm rss92.txt
mv rss92_sorted.txt rss92.txt

