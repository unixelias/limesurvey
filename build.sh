 #!/bin/bash
shopt -s extglob

#for i in $( ls docker); do
#  case "$i" in
#       *-test )  ;;
#       * ) docker build -t unixelias/Limesurvey:$i docker/$i ;;
#  esac
#done

docker build -t unixelias/Limesurvey:0.0.1-dev docker/dev
