#!/usr/bin/env bash

set -e

middleman build --clean --verbose || exit 192

rsync -e "ssh" -a --progress --stats tmp/ tp-www-000:/srv/www/www.benden.us/ && \
    echo "Successfully deployed."
