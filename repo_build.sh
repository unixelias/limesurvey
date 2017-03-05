#!/bin/bash
curl -H "Content-Type: application/json" --data '{"docker_tag": "dev"}' -X POST https://registry.hub.docker.com/u/unixelias/limesurvey/trigger/$TRIGGER_TOKEN/
