#!/bin/bash

build_image() {
  set -ex
  docker build --no-cache --pull -f Dockerfile.$1 -t ${image}:$1 .
  docker push ${image}:$1
  set +ex
}

image=zharbor.softleader.com.tw/library/ulu-openjdk-alpine
tags=(11-jre-taipei 11-font-jre-taipei 8-jre-taipei 8-font-jre-taipei)

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
