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

#!/bin/bash
path=$3 #取原始路径，我的环境下如果是单文件则为/data/demo.png,如果是文件夹则该值为文件夹内某个文件比如/data/a/b/c/d.jpg
downloadpath='/usr/local/caddy/www/aria2/Download'  #修改成Aria2下载文件夹
domain='moerats.com'  #修改成自己域名

if [ $2 -eq 0 ]
        then
                exit 0
fi
while true; do  #提取下载文件根路径，如把/data/a/b/c/d.jpg变成/data/a
filepath=$path
path=${path%/*}; 
if [ "$path" = "$downloadpath" ] && [ $2 -eq 1 ]  #如果下载的是单个文件
    then
    php /www/wwwroot/$domain/one.php upload:file $filepath /$folder/
    rm -rf $filepath
    php /www/wwwroot/$domain/one.php cache:refresh
    exit 0
elif [ "$path" = "$downloadpath" ]
    then
    php /www/wwwroot/$domain/one.php upload:folder $filepath /$folder/
    rm -rf "$filepath/"
    php /www/wwwroot/$domain/one.php cache:refresh
    exit 0
fi
done