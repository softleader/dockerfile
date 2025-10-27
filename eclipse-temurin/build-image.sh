#!/bin/bash

build_image() {
  set -ex
  docker build -f Dockerfile.$1 -t ${image}:$1 .
  docker push ${image}:$1
  set +ex
}

image=harbor.softleader.com.tw/library/eclipse-temurin-alpine
tags=($(ls -1 Dockerfile.* | sed 's/Dockerfile.//' | sort -t- -k1 -n -r))

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
