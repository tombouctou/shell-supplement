#!/bin/bash

if [ ! -f "$1" ]; then
    echo "file \"$1\" does not exist."
    exit 1
fi

cat "$1" | xargs -n1 | \
    tr A-Z a-z | \
    sed -e 's/\.//g' -e 's/\,//g' -e 's/ //g' | \
    sort | uniq -c | sort -nr
