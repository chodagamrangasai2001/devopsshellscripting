#!/bin/bash
INPUT=$1
SIZE=${#INPUT}
STRING_LENGTH=$(expr $SIZE - 1)
REVERSE=''
echo $STRING_LENGTH
for ((I = $STRING_LENGTH; I >= 0; I--)); do
    echo ${INPUT[@]:$I:1}
    REVERSE=${REVERSE}${INPUT[@]:$I:1}
done
