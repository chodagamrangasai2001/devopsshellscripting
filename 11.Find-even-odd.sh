#!/bin/bash
for I in {2..100}
do 
if [$(expr $I % 2 ) == 0];
then 
echo "$I is the even number"
fi
done    