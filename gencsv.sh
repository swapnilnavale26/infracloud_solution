#!/bin/bash
rm -rf inputFile
RANDOM=$$

num=0

while [[ ${num} -le 10 ]]
do
  echo $num "," $RANDOM >> inputFile
  (( num = num + 1 ))
done

