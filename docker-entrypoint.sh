#!/bin/sh
set -e

if [ "$1" = 'sh' ]; then
    /bin/sh
fi

# prepare config file
if [ -f "./conf/config.ts" ]; then
    cp conf/config.ts ./
    ./node_modules/.bin/tsc -t ES6 -m ES6 --sourcemap --esModuleInterop --removeComments config.ts
else 
    echo "You need to provide a config.ts file."
    exit 1
fi

exec "$@"