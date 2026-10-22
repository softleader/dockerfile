#!/bin/bash

build_image() {
  set -ex
  docker buildx build --platform linux/amd64,linux/arm64 \
    -f "Dockerfile.$1" -t "${image}:$1" --push .
  set +ex
}

image=harbor.softleader.com.tw/library/pnpm/node
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
