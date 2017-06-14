#!/bin/bash
shopt -s extglob

for i in $( ls docker); do
  case "$i" in
       *-test )  ;;
       * ) docker build -t unixelias/limesurvey:$i docker/$i && docker push unixelias/limesurvey:$i ;;
  esac
done


#Exclusivo para DEV version
#docker build -t unixelias/limesurvey:dev docker/dev
