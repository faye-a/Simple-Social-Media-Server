#!/bin/bash
#creating to make a message to the friends wall

receiver=$1
sender=$2
message=$3

if [ $# -ne 3 ]; then
	echo "Error: parameters problem." >&2
	exit 1
elif ! [ -d "users/$receiver" ]; then
	echo "Error: Receiver $receiver does not exist." >&2
	exit 2
elif ! [ -d "users/$sender" ]; then
	echo "Error: Sender $sender does not exist." >&2
	exit 3
elif ! grep -Fxq "$sender" "$receiver/friends"; then
        echo "Error: $friend and $user are not friends." >&2
        exit 4
else
echo "$sender: $message" >> "$receiver/wall"
echo "OK: friend added."
exit 0
fi
