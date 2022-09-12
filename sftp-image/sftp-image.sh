#!/bin/bash
set -e

if [ "$#" -eq 0 ]; then
  echo "Requires at least one image"
  exit 1
fi

host=${HOST-softleader.com.tw}
port=${PORT-2224}
user=${USER}
password=${PASSWORD}
remote_dir=${REMOTE_DIR}
tar_path=/tmp/${TAR_NAME-images_$(date +"%Y%m%d_%H%M%S").tar}
local_file_path=${tar_path}.gz
images="$@"

pull_image() {
  set -x
  docker pull $1
  { set +x; } 2>/dev/null
}

save_tar_gz() {
  set -x
  docker save -o ${tar_path} ${images}
  zip -r ${local_file_path} ${tar_path}
  { set +x; } 2>/dev/null
}

sftp_upload() {
  set -x
  sshpass -p ${password} sftp -o StrictHostKeyChecking=no -P ${port} ${user}@${host}:${remote_dir} <<< $"put ${local_file_path}"
  { set +x; } 2>/dev/null
}

for arg; do
  pull_image $arg
done
save_tar_gz
sftp_upload
