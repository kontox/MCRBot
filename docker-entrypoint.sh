#!/bin/sh
set -e

if [ "$1" = 'sh' ]; then
    /bin/sh
fi

./node_modules/.bin/tsc

exec "$@"