#!/bin/bash

build_image() {
  set -ex
  docker build -f Dockerfile -t ${image} .
  docker push ${image}
  set +ex
}

image=harbor.softleader.com.tw/library/redoc-cli
build_image
