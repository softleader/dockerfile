#!/bin/bash

build_image() {
  set -ex
  docker build -f Dockerfile.$1 -t harbor.softleader.com.tw/library/zulu-openjdk-alpine:$1 .
  docker push harbor.softleader.com.tw/library/zulu-openjdk-alpine:$1
  set +ex
}

tags=(11-jre-taipei 11-font-jre-taipei 8-jre-taipei 8-fornt-jre-taipei)
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