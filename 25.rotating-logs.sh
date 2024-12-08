#https://www.linode.com/docs/guides/solving-real-world-problems-with-bash-scripts-a-tutorial/

#!/bin/bash
set +x
#f="/var/log/nginx/access.log"
read -p "Enter The File Path(Eg:/var/log/nginx/access.log):" f
if [ ! -f $f ]; then
    echo $f does not exist!
    exit
fi

#touch ${f}
MAXSIZE=$((10 * 1024))

size=$(du -b ${f} | tr -s '\t' ' ' | cut -d' ' -f1)
if [ ${size} -gt ${MAXSIZE} ]; then
    echo Rotating!
    timestamp=$(date +%s)
    mv ${f} ${f}.$timestamp
    aws s3 cp ${f}.$timestamp s3://devsecopsb43data/${f}.$timestamp
    touch ${f}
else
    echo "The file ${f} size is ${size} which is less than 10MB. No need to rotating."
fi

#-------------OLD-CODE------------

#
#f="/var/log/testfile.log"
#
#if [ ! -f $f ]; then
#    echo $f does not exist!
#    exit
#fi
#
##touch ${f}
#MAXSIZE=$((10 * 1024))
#
#size=$(du -b ${f} | tr -s '\t' ' ' | cut -d' ' -f1)
#if [ ${size} -gt ${MAXSIZE} ]; then
#    echo Rotating!
#    timestamp=$(date +%s)
#    mv ${f} ${f}.$timestamp
#    touch ${f}
#fi
#
#------------FIND FILE SIZES USING FIND COMMAND------------
