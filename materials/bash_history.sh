#!/bin/bash
cat ~/.bash_history \
	| sed 's/^ \+//;s/ / /' \
	| cut -d' ' -f2- \
	| awk '{ count[$0]++ } END { for (i in count) print count[i], i }' \
	| sort -rnk 1 | head -n 10
