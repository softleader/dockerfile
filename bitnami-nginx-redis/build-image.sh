#!/bin/bash

image=harbor.softleader.com.tw/library/bitnami-nginx-redis:1.19.6

docker build -f Dockerfile -t ${image} .
docker push ${image}
