 #!/bin/bash
shopt -s extglob

#for i in $( ls docker); do
#  case "$i" in
#       *-test )  ;;
#       * ) docker build -t unixelias/Limesurvey:$i docker/$i ;;
#  esac
#done

docker build -t unixelias/Limesurvey:dev docker/dev
