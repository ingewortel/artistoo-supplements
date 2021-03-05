folder=img
expname=ActModel
r=10 # output framerate

mkdir gif-tmp-$expname


find $folder -name "$expname-t*.png" -print | sort --version-sort  | awk '{print $0, "tmp-"NR".png" }' > gif-tmp-$expname/tmp-$expname.txt



while read line; do \

	file1=$( echo $line | awk '{print $1}' )
	file2=$( echo $line | awk '{print $2}' )
	cp $file1 gif-tmp-$expname/$file2
	
done < gif-tmp-$expname/tmp-$expname.txt



ffmpeg -i "gif-tmp-$expname/tmp-%d.png" -r $r -vf scale=256:-1 $expname.gif 

rm -rf gif-tmp-$expname