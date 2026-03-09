#!/bin/bash

TOKEN=$TELEGRAM_TOKEN
CHAT_ID=$TELEGRAM_CHAT_ID

MESSAGE=$1

curl -s -o /dev/null -X POST https://api.telegram.org/bot$TOKEN/sendMessage \
-d chat_id=$CHAT_ID \
-d text="$MESSAGE"
