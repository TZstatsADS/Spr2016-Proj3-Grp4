
FILES="./images10/*"

for f in $FILES
do
	echo "Processing $f......"
	echo -n "${f:11} ">>featrues.txt 
	/home/andy/ADS/project3/OverFeat/OverFeat/bin/linux_64/overfeat -f $f |tail -1 >>featrues.txt 2>&1

done
	




