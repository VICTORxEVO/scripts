#!/bin/bash

path="./albaroud"
sleep_time="0.01m"  #sleep time in minute including floating point like 0.2 minute
                   # s for seconde, m for minute, h for hour, d for day
size=0
size_suffix="m" #size suffix like K, M, G, T for kb, mb, gb, tb
min_size=2
max_size=10
size_scaling=1 #amount of size is increased each time

#this is function sytax in bash
file_extander ()
{
    for ((size; size < max_size; size += size_scaling));
    do
        if [ $size -gt 0 ]; #skip cmd if the size is less than or equal 0
        then
            fallocate -l "${size}${size_suffix}" "$path"   
        fi
        sleep "$sleep_time"
        echo "size of \"$(basename "$path")\" is $(du -sh "$path" | cut -d '	' -f 1)"
    done
    ((size -= (2 * size_scaling)))
    for ((size; size > min_size; size -= size_scaling));
    do
        truncate -s "${size}${size_suffix}" "$path"
        sleep "$sleep_time"
        echo "size of \"$(basename "$path")\" is $(du -sh "$path" | cut -d '	' -f 1)"
    done
}

rm -f "$path" #remove file if it exists
touch "$path" #create the file

file_extander  #call function here by the name

rm -f "$path" #remove file after using it