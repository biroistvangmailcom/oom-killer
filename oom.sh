#!/bin/bash
# Displays running processes in descending order of OOM score
#printf 'PID\tOOM Score\tOOM Adj\tCommand\n'
while read -r pid comm; do [ -f /proc/$pid/oom_score ] && [ $(cat /proc/$pid/oom_score) != 0 ] && printf '%d\t%d\t\t%d\t%s\n' "$pid" "$(cat /proc/$pid/oom_score)" "$(cat /proc/$pid/oom_score_adj)" "$comm"; done < <(ps -e -o pid= -o comm=) | sort -k 2nr | head -10 | awk '{ print $1 }' oom_score_adj.txt &&

file=""
while read line; do
echo $line;
echo 1000 > /proc/$line/oom_score_adj
done < "${file}"
