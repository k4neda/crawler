#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Usage: $0 CC"
	exit
fi

CC=$1
echo "crawling for country $CC"

for i in `seq 0 10`;
do
	curl --silent http://www.alexa.com/topsites/countries\;$i/$CC | grep -oP '(?<=\<a href="\/siteinfo\/).*?(?=">)' | while read line; do curl -Ls -o /dev/null -w %{url_effective} $line; echo; done
	#while read line; do echo "$line"; done
	#curl -Ls -o /dev/null -w %{url_effective} #URL here 
done 
