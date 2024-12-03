#!/bin/bash
for FILE in $(find / -name awscliv2.zip); do
echo $FILE
mkdir -p /tmp/date 2> /dev/null
cp $FILE /tmp/date
DATE=$(date +%s)
mv /tmp/date/awscliv2.zip /tmp/date/awscliv2-${DATE}.zip
ls -al /tmp/date
done