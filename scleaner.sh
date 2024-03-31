#!/bin/bash


du -sh /nfs/sgoinfre/goinfre/Perso/ysbai-jo | awk '{printf ("\033[31mBefore Cleaning: %s\033[0m\n\n", $1)}'

sleep 1
awk 'BEGIN {printf ("\033[33mLoading...\033[0m\n\n")}'
sleep 4
du -sh /nfs/sgoinfre/goinfre/Perso/ysbai-jo | awk '{printf ("\033[32mAfter Cleaning: %s\033[0m\n\n", $1)}'
sleep 4
slock

