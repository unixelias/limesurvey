#!/bin/bash
shopt -s extglob

last=""

for i in $( ls docker); do
  case "$i" in
       *-test|dev )  ;;
       * ) docker build -t unixelias/limesurvey:$i docker/$i \
            && docker push unixelias/limesurvey:$i \
            && last=$i \
            ;;
  esac
done

docker tag unixelias/limesurvey:$last unixelias/limesurvey:latest && docker push unixelias/limesurvey:latest

#Exclusivo para DEV version
#docker build -t unixelias/limesurvey:dev docker/dev
