#https://www.linode.com/docs/guides/solving-real-world-problems-with-bash-scripts-a-tutorial/
#!/bin/bash
#set -x
# default value to use if none specified
PERCENT=30

if [[ $# -le 0 ]]; then
    printf "Using default value of ${PERCENT} for threshold.\n"
else
    #if [[ $1 =~ ^-?[0-9]+([0-9]+)?$ ]]; then RegEx is not working as expected.
    if [ $1 -le 100 -a $1 -gt 0 ]
    then
        PERCENT=$1
    else
        echo "Invalid Input Value. The Threshold Value Must Be Between 0 To 100"
        exit 1
    fi
fi

#let "PERCENT += 0"
#printf "Threshold = %d\n" $PERCENT
echo "Threshold = $PERCENT"
df -Ph | grep -i root | awk '{ print $5,$1 }' | while read data; do
    usedspace=$(echo $data | awk '{print $1}' | sed s/%//g)
    partition=$(echo $data | awk '{print $2}')
    if [ $usedspace -ge $PERCENT ]; then
        echo "WARNING: The partition \"$partition\" has used $usedspace% of total available space and above Threshold  of $PERCENT  - Date: $(date)"
    else
        echo "Your Disk Space of \"$partition\" is well below the Threshold  of $PERCENT and current utilization is $usedspace% ."
    fi
done