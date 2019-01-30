#!/bin/bash -eu

set -o pipefail

# SoftLeader Apps is run with user `softleader`, uid = 1000
# If you bind mount a volume from the host or a data container,
# ensure you use the same uid
change_ownership_of_sl_home() {
	mkdir -p /tmp $SL_HOME $SL_DUMPS $SL_LOGS
	chown -R ${_uid}:${_gid} /tmp $SL_HOME
}

add_softleader_user_group() {
	addgroup -g ${_gid} ${_group}
	adduser -h "$SL_HOME" -u ${_uid} -G ${_group} -s /bin/bash -D ${_user}
}

change_ownership_of_sl_home
add_softleader_user_group

exec su ${_user} -c "$*"
