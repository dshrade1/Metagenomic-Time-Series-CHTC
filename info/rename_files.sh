cd percent_perfect

BEGIN=0.7
INTERVAL=0.01
END=1.0

for a in `seq $BEGIN $INTERVAL $END`; do
mv percent_perfect_random_$a.txt percent_reads_random_$a.txt
done

