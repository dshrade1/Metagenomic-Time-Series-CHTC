# ./listReadFiles_random.sh

cd mapping_output

for k in $(ls *_0.70.err); do
echo "${k:0:8}" >> ../readFileList_random.txt
done

# this all works
#DATA_FILES=*
#for k in $DATA_FILES; do
#echo "${k:0:8}" >> ../readFileList_random.txt
#done

# this works
#cd $1
#DATA_DIRS=*
#for i in $DATA_DIRS; do
#cd "$i"
#DATA_FILES="$i"/*
#for k in $DATA_FILES; do
#echo "$i $k" >> readFileList.txt
#done
#done


