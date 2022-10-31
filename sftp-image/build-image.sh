#!/bin/bash

image=harbor.softleader.com.tw/library/sftp-image

build_image() {
  set -x
  docker build -f Dockerfile -t ${image} .
  docker push ${image}
  { set +x; } 2>/dev/null
}

build_image
