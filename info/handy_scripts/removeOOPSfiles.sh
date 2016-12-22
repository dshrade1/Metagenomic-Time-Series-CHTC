# ./removeOOPSfiles.sh

DATA_DIRS=*
for i in $DATA_DIRS; do
#echo "$i"
rm $i/errsizes_bytes.txt
done
