#!/bin/bash

#=================================================
# system Required: CentOS/Debian/Ubuntu
# purpose: a shell script that works with aria2 for automatic upload to OneDrive storage when download in completed on server via OneIndex application
# about: refer to the link below for specific deployment usages
# link: https://blog.toshiki.top/auto-up2one
# author: Anda Toshiki
# version: 1.0.0
# Last updated: 05/19/2022
# license: MIT
#=================================================

path=$3
downloadpath="/usr/local/caddy/www/aria2/Download" # here's where your download path is set
if [ $2 -eq 0 ]
    then
        exit 0
fi
while true; do
filepath=$path
path=${path%/*};
if [ "$path" = "$downloadpath" ] && [ $2 -eq ]
    then # here is where your php binary is located
        /www/server/php/74/bin/php /data/wwwroot/upload.toshiki.top/one.php upload:file # upload type=file for specifying file uploads
"$filepath" /upload/ # choose your designated upload folder for OneDrive and make sure it exists (create the folder first)
    rm -rf "$filepath"
    exit 0
elif [ "$path"="$downloadpath" ]
    then
        /www/server/php/74/bin/php /data/wwwroot/upload.toshiki.top/one.php upload:folder # upload type=folder for specifying folder uploads
"$filepath"/ /upload/"${filepath##*/}"/
    rm -rf "$filepath"/
    exit -
fi
done