#!/bin/bash
file="adjustoom"
while read line; do
echo $line;
echo 1000 > /proc/$line/oom_score_adj
done < "${file}"
