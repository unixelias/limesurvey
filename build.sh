#!/bin/bash
shopt -s extglob

docker build -t unixelias/limesurvey:${TRAVIS_BRANCH} \
                   --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
                   --build-arg VCS_BRANCH=${TRAVIS_BRANCH} \
                   --build-arg VCS_REF=`git rev-parse --short HEAD` \
                   --build-arg LS_VERSION=${TRAVIS_BRANCH} \
                   docker;                   

docker push unixelias/limesurvey:${TRAVIS_BRANCH};
