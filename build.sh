#!/bin/bash
shopt -s extglob

docker build -t unixelias/limesurvey:${TRAVIS_BRANCH} \
                   --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
                   --build-arg BRANCHE_VCS=${TRAVIS_BRANCH} \
                   --build-arg VCS_REF=`git rev-parse --short HEAD` \
                   --build-arg LS_VERSION=`git ls-remote --tags https://github.com/LimeSurvey/LimeSurvey.git | awk '{print $2}' | grep -v '{}' | awk -F"/" '{print $3}' | sort -n -t. -k1,1 -k2,2 -k3,3 | tail -n 1`\
                   docker;                   

docker push unixelias/limesurvey:${TRAVIS_BRANCH};
