#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
END='\033[0m'

path="/nfs/sgoinfre/goinfre/Perso/$USER"

snap_path=$(find "$path" -type d -name Snapshots)

storage=$(du -sh "$path" | tr '\t' ' ' | cut -d ' ' -f 1)

if [ -z "$snap_path" ]
then
    echo -e "sclean: ${RED}Snapshots directory not found${END}"
    exit 100
elif [ -z "$(ls "$snap_path")" ]
then
    echo -e "sclean: ${YELLOW}Snapshots directory is empty, nothing to be cleaned${END}"
    exit 1
fi

echo -e "${RED}Before: ${storage}${END}"
sleep 0.8

echo -e "${YELLOW}Cleaning....${END}"

rm -f "$snap_path"/*
sleep 2

echo -e "${GREEN}After: ${storage}${END}"
sleep 0.1

