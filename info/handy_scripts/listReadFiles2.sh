# creates a readFileList for only the 2 metagenomes that took longer to map
# move this file to map directory to run

for dir in IHSY
do 
while read line 
do 
echo $dir $line >> readFileList2.txt
done < $dir/readFileList.txt
#rm $dir/readFileList.txt
done

for dir in IHXB
do
while read line
do
echo $dir $line >> readFileList2.txt
done < $dir/readFileList.txt
#rm $dir/readFileList.txt
done
