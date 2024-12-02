#!/bin/bash
for FILE in $(find / -name awscliv2.zip); do
    echo $FILE
    cp $FILE /tmp/ranga
    mv /tmp/ranga/awscliv2.zip /tmp/ranga/awscliv2-${RANDOM}.zip
done
##############
#!/bin/bash
##for FILE in $(find / -name awscliv2.zip); do
    #echo $FILE
    #cp $FILE /tmp/date
    #DATA=$(data +%s)
    #mv /tmp/date/awscliv2.zip /tmp/date/awscliv2-${DATE}.zip
    #ls -al /tmp/date
#done
