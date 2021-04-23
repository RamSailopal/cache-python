#!/bin/bash
if [[ "$1" == "" ]]
then
	echo "Pass either 32 or 64 as the first variable based on the chip architecture"
        exit
fi
if [[ "$1" == "64" ]]
then
	pat="/usr/lib64"
else
	pat="/usr/lib"
fi
while read vers
do
        mainvers=$(awk -F. -v pat="$pat" '{ gsub(pat"/python","",$1);print $1}' <<< "$vers")
        if [[ "$mainvers" == "2" ]]
        then
                if test -e "$vers/site-packages/intersys"
                then
			echo "Python2 libraries already exist"
                else
			echo "Installing Python2 libraries"
                        mkdir -p "$vers/site-packages/intersys"
                        cp -R /usr/local/cache-python/python2/intersys/* "$vers/site-packages/intersys"
                fi
        elif [[ "$mainvers" == "3" ]]
        then
                if test -e "$vers/site-packages/intersys"
                then
                        echo "Python3 libraries already exist"
                else
			echo "Installing Python3 libraries"
			mkdir -p "$vers/site-packages/intersys"
                        cp -R /usr/local/cache-python/python3/intersys/* "$vers/site-packages/intersys"
		fi
        fi
done <<< "$(find "$pat" -maxdepth 1 -mindepth 1 -type d -name "python*")"
