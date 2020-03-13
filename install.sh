#!/bin/sh

cd ~/ibaozi/ibaozi/

git pull

cp web.zip /var/www/

cd /var/www/

rm -r html
rm -r web

unzip web.zip

cp -r web html

