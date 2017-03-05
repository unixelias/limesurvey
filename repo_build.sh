#!/bin/bash
curl -H "Content-Type: application/json" --data '{"build": true}' -X POST https://registry.hub.docker.com/u/unixelias/limesurvey/trigger/$TRIGGER_TOKEN/
