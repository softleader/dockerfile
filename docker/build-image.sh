#!/bin/bash

image=harbor.softleader.com.tw/library/docker:dind

docker build -f Dockerfile -t ${image} .
docker push ${image}
