#!/usr/bin/zsh
cat ~/.zsh_history \
	| sed 's/^.\+0;//g' \
	| awk '{ count[$0]++ } END { for (i in count) print count[i], i }' \
	| sort -rnk 1 | head -n 10
