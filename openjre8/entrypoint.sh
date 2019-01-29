#!/bin/bash -eu

set -o pipefail

change_ownership_of_sl_home() {
	mkdir -p /tmp $SL_HOME $SL_DUMPS $SL_LOGS
	chown -R ${_uid}:${_gid} /tmp $SL_HOME
}

add_softleader_user_group() {
	addgroup -g ${_gid} ${_group}
	adduser -h "$SL_HOME" -u ${_uid} -G ${_group} -s /bin/bash -D ${_user}
}

switch_user() {
	su ${_user}
}

change_ownership_of_sl_home
add_softleader_user_group
switch_user

exec "$@"
