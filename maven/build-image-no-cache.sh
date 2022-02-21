#!/bin/bash

build_image() {
  set -ex
  docker build --no-cache --pull -f Dockerfile.$1 -t ${image}:$1 .
  docker push ${image}:$1
  set +ex
}

image=harbor.softleader.com.tw/library/maven
tags=(3-eclipse-temurin-8 3-azulzulu-11 3-eclipse-temurin-11 3-azulzulu-17 3-eclipse-temurin-17)

if [ "$1" = "ls" ]; then
  for tag in "${tags[@]}"
  do
      echo "$tag"
  done
elif [ "$1" ]; then
  build_image $1
else
  for tag in "${tags[@]}"
  do
      build_image $tag
  done
fi
