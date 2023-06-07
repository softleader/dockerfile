#!/bin/bash
set -e

if [ "$#" -eq 0 ]; then
  echo "requires at least 1 image."
  exit 1
fi

host=${HOST-softleader.com.tw}
port=${PORT-2224}
user=${USER-${user}}
password=${PASSWORD}
remote_dir=${REMOTE_DIR}
tar_name=${TAR_NAME-${TAR_NAME_PREFIX-images}_$(date +"%Y%m%d_%H%M%S")}.tar
tar_path=/tmp/${tar_name}
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

ensure_remote_dir_exist() {
  set +e
  set -x
  sshpass -p ${password} sftp -o StrictHostKeyChecking=no -P ${port} ${user}@${host} <<< $"mkdir ${remote_dir}"
  { set +x; } 2>/dev/null
  set -e
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
ensure_remote_dir_exist
sftp_upload
