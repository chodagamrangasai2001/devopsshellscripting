#!/bin/bash
for FILE in $(find / -name awscliv2.zip); do
    echo $FILE
    #if [[ ls /tmp/demo = false ]]; then
    #mkdir -p /tmp/demo/
    #fi
    cp $FILE /tmp/demo/
    mv /tmp/demo/awscliv2.zip /tmp/demo/awscliv2-${RANDOM}.zip
done
##############

#!/bin/bash
for FILE in $(find / -name awscliv2.zip); do
echo $FILE
cp $FILE /tmp/date
DATA=$(data +%s)
mv /tmp/date/awscliv2.zip /tmp/date/awscliv2-${DATE}.zip
ls -al /tmp/date
done
