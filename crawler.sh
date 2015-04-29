#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Usage: $0 CC"
	exit
fi

CC=$1
echo "crawling for country $CC"

for i in `seq 0 10`;
do
	curl --silent http://www.alexa.com/topsites/countries\;$i/$CC | grep -oP '(?<=\<a href="\/siteinfo\/).*?(?=">)'
done 
