#!/bin/bash

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker build -t asweteam1/preference-skill:latest -t asweteam1/preference-skill:$TRAVIS_TAG --label version="$TRAVIS_TAG" .
docker push asweteam1/preference-skill:latest
docker push asweteam1/preference-skill:$TRAVIS_TAG