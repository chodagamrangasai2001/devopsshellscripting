SLACK_WEB='https://hooks.slack.com/services/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'
#!/bin/bash
if [ $# -gt 0 ]; then
    for USERNAME in $@; do
        if [ [ $USERNAME =~ ^[a-d][e-h][i-l][0-9][0-9][0-9]$ ] ]; then
            EXISTING_USER=$(cat /etc/passwd | grep -i -w $USERNAME | cut -d ":" -f1)
            if [ "${USERNAME}" = "${EXISTING_USER}" ]; then
                echo "The user ${USERNAME} Already exists. try diff. username "
            else
                echo "The user ${USERNAME} don't exist. creating the user"
                useradd -m -s /bin/bash $USERNAME
                SPEC_CHAR1=$(echo '!@#$%^&*()' | fold -w1 | shuf | head -1)
                SPEC_CHAR2=$(echo '!@#$%^&*()' | fold -w1 | shuf | tail -1)
                PASSWORD="India@${SPEC_CHAR1}${RANDOM}${SPEC_CHAR2}"
                echo "$USERNAME : $PASSWORD" | sudo chpasswd
                passwd -e $USERNAME
                curl -X POST ${SLACK_WEB} -sL -H 'content-type:application/json' --data "{"text":
                \"username is : ${USERNAME}\"} >>/dev/null 
                curl -X POST ${SLACK_WEB} -sL -H 'content-type:application/json' --data "{"text"\"Temporary password is : ${PASSWORD} reset it . \"} >>/dev/null

            fi
        else
            echo "The username ${USERNAME} does not match with regex pattern. Please provide the username in format of 'abc123' "
        fi
    done
else
    echo "Please provide the username to create the user"
fi
