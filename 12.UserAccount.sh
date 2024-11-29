#!/bin/bash
while true; do
    read -p "please enter username : " USERNAME
    echo $USERNAME
    EXISTING_USER=$(cat /etc/passwd | grep -i -w $USERNAME | cut -d ':' -f 1)
    if [ "${EXISTING_USER}" = "${USERNAME}" ]; then
        echo "The username $USERNAME already exists.. "
    else
        echo "User name $USERNAME is new user"
        useradd -m $USERNAME --shell /bin/bash
        SPEC=$(echo '!@#$%^&*' | fold -w1 | shuf | head -1)
        PASSWORD="India@${RANDOM}${SPEC}"
        echo "$USERNAME : $PASSWORD" | sudo chpasswd
        passwd -e $USERNAME
        echo " Login with $USERNAME WITH PASSWORD $PASSWORD"
    fi
done
