#!/bin/bash
source_folder=$1
destination_folder=$2
type=$3 

if [ -d $destination_folder ]; then
    echo "Directory exists."
else 
    mkdir $destination_folder
fi

# # echo $(ls -d -1 "$source_folder/"*.gv)

for fname in $(ls $source_folder | grep -e ".gv")
do
    dname=$(echo $fname | sed "s/.gv/.$type/")
    gpath="$source_folder/$fname"
    dpath="$destination_folder/$dname"
    echo "processing $gpath -> $dpath..."
    case $type in  
        *png*)   
        $(cat $gpath |  dot -Tpng > $dpath);;   
        *ps*) 
        $(cat $gpath |  dot -Tps > $dpath);;   
        *)    
        echo "Not supported" ;; 
    esac
done