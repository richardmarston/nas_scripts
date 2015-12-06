#!/bin/ash

remote=`echo $1 | awk -F '/' '{ print $1"//"$3 }' | sed 's/i/www/'`
echo "Logging into: $remote"
read -s -p "Enter User: " myuser
read -s -p "Enter Password: " mypassword

wget  --save-cookies cookies.txt \
	--post-data 'user=$myuser&password=$mypassword' \
	http://bbcredux.com

wget --load-cookies cookies.txt -p $1 --output-document $2

rm cookies.txt

