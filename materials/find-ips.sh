#!/bin/sh
m='[0-9][0-9]*'
mask="$m[.]$m[.]$m[.]$m"
find /etc -exec grep -H -n -I $mask {} 2>/dev/null \;
