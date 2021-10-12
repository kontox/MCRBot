#!/bin/sh
set -e
CURRENT_UID=${uid:-9999}

echo "Running as user ID: $CURRENT_UID"
if ! id mcrbot &>/dev/null; then 
    adduser -s /bin/sh -u $CURRENT_UID -D -H mcrbot
    ./node_modules/.bin/tsc
fi

exec su-exec mcrbot "$@"