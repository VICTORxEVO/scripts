#!/bin/bash

YELLOW='\033[0;33m'
END='\033[0m'
GREEN='\033[0;32m'


bin_dir="$HOME/perso_bin"

path_bin="export PATH=\"$bin_dir:\$PATH\""

shell_dir=".$(echo "$SHELL" | rev | cut -d '/' -f 1 | rev)rc"

mkdir  "$bin_dir" 2> /dev/null 

if [ $(echo $?) -ne 0 ] && command -v sclean > /dev/null 2>&1;
then
    echo -e "sclean_setup: ${YELLOW}sclean command already exist${END}"
    exit 10
fi
echo -e "${YELLOW}Instaling....${END}"

echo -e "$path_bin" >> "$HOME/${shell_dir}"

cp sclean "$bin_dir"

chmod +x "$bin_dir/sclean"

sleep 1.5

echo -e "${GREEN}Command installed successfully, you can type 'sclean' to clean Snapshots${END}"

exec "$SHELL"

exit 0