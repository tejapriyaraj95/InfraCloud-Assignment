#!/bin/bash
RANDOM=$$
num="$1"
count="$2"
while [[ ${num} -le ${count} ]]
do
    echo $num, $RANDOM
    (( num = num +1 ))
done > inputFile
