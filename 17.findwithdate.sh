#!/bin/bash
for FILE in $(find / -name awscliv2.zip); do
echo $FILE
cp $FILE /tmp/date
DATE=$(date +%s)
mv /tmp/date/awscliv2.zip /tmp/date/awscliv2-${DATE}.zip
ls -al /tmp/date
done