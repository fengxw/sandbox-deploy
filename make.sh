#!/bin/sh

IFS=$'\n'

compose_file=./docker-compose.yml

rm -rf $compose_file

basepath=$(cd "$(dirname "$0")"; pwd)

FILE=docker-compose.yml.dist

touch $compose_file

cat $FILE | while read line; do
    echo ${line/~\/sandbox-deploy/$basepath}>>$compose_file
done