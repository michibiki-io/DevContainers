#!/bin/bash
set -euo pipefail

map_uidgid() {
    USERMAP_ORIG_UID=$(id -u developer)
    USERMAP_ORIG_GIDS=$(id -G developer)
    USERMAP_UID=${USERMAP_UID:-$USERMAP_ORIG_UID}
    USERMAP_GIDS=${USERMAP_GIDS:-$USERMAP_ORIG_GIDS}
    if [ "${USERMAP_UID}" != "${USERMAP_ORIG_UID}" ] || [ "${USERMAP_GIDS}" != "${USERMAP_ORIG_GIDS}" ]; then
        echo "Starting with UID : $USERMAP_UID, GID: $USERMAP_GIDS"
        USERMAP_GIDS=($USERMAP_GIDS);
        usermod -u $USERMAP_UID -o developer
        groupmod -g ${USERMAP_GIDS[0]} developer
        for i in ${USERMAP_GIDS[@]}; do
            if [ ${USERMAP_GIDS[0]} -ne $i ]; then
                groupadd -g $i $i;
                usermod -aG $i developer
            fi
        done
        chown developer:developer /home/developer

        if [ -d "/go" ]; then
            chown -R developer:developer /go
        fi
    fi
}

if [ "$(id -u)" = '0' ]; then
    map_uidgid
    exec gosu developer "$@"
else
    exec "$@"
fi
