#!/bin/bash
# proper header for bash script

# This program outputs infinite garbage/# files

GARBAGE=$HOME/garbage

mkdir $GARBAGE  # in case garbage directory doesn't exist, create it

line=$RANDOM  # creates variable called line that is a random digit to reduce compression effectiveness

old=0

while true
do
    let new=old+1 

    echo $line >> $GARBAGE/$old  # append line to FILE
    
    cp $GARBAGE/$old $GARBAGE/$new  # create next file for new loop

    line=$line$RANDOM  # make a new line thats longer by 1

    let old=new
done
