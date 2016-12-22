# first concatenate the percent reads mapped

mkdir percent_reads
mkdir percent_perfect
mkdir percent_error
cd mapping_output

BEGIN=0.7
INTERVAL=0.01
END=1.0

for a in `seq $BEGIN $INTERVAL $END`; do
# echo "$a" >> ../percent_reads_random.txt

while read i; do
tail -n 16 "$i"_$a.err | head -n 1 >> ../percent_reads/percent_reads_random_$a.txt
tail -n 11 "$i"_$a.err | head -n 1 >> ../percent_perfect/percent_reads_random_$a.txt
tail -n 7 "$i"_$a.err | head -n 1 >> ../percent_error/percent_reads_random_$a.txt
done < ../readFileList_random.txt

done
# then concatenate the percent bases mapped

# possibly pipe the head output to another tail
