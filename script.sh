#!/in/sh

awk -F"\t"  "{$1= $patent_number FS $1;}1" OFS= e
pwd| find -L |grep -i "ipg" >file_names.txt
perl -p -n -e "s/patents/patents_output/g" file_names.txt >> output_names.txt
 lines=$(cat file_names.txt|wc -l)
echo $lines
for (( a=1; a<=3;a++ ))
do
#echo "extracting file $a of $lines "
path=$(sed -n "$a"p file_names.txt )
output=$(sed -n "$a"p output_names.txt )
cd ~//DNorm-0.0.6
./ApplyDNorm.sh config/banner_NCBIDisease_UMLS2013AA_TEST.xml data/CTD_diseases.tsv output/simmatrix_NCBIDisease_e4.bin AB3P_DIR TEMP $path $output

#unzip -u $path -d unzip_biblio/
done

