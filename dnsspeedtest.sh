#!/bin/bash
red=`tput setaf 196`
green=`tput setaf 2`
reset=`tput sgr0`
IFS=$'\n'       # make newlines the only separator
for LINE in $(cat ./dnstest.txt)
do
    echo -ne "$LINE " &&  echo "$LINE" | sed -e 's#.*: \(\)#\1#' | xargs ping -W 1 -c 1 | grep -E "time=|0 received" | echo -e "${green}$(sed 's/^.*time=/time=/')${reset}" | echo -e "${red}$(sed 's/^.*time /time /')${reset}"
done
