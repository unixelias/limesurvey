#!/bin/bash
shopt -s extglob

for i in $( ls docker); do
  case "$i" in
       *-test )  ;;
       * ) docker build -t unixelias/limesurvey:$i docker/$i && docker push unixelias/limesurvey:$i ;;
  esac
done

docker tag unixelias/limesurvey:2.72.4 unixelias/limesurvey:latest && docker push unixelias/limesurvey:latest

#Exclusivo para DEV version
#docker build -t unixelias/limesurvey:dev docker/dev
