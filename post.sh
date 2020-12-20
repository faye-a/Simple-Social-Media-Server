#!/bin/bash
#creating to make a message to the friends wall

receiver="$1"
sender="$2"
message="$3"

if [ "$#" -lt 3 ]; then
	echo "Error: parameters problem." >&2
	exit 1
elif ! [ -d "$receiver" ]; then
	echo "Error: Receiver $receiver does not exist." >&2
	exit 2
elif ! [ -d "$sender" ]; then
	echo "Error: Sender $sender does not exist." >&2
	exit 3
elif ! grep -Fxq "$sender" "$receiver/friends"; then
        echo "Error: $sender and $receiver are not friends." >&2
        exit 4
else
	./P.sh
	echo "$sender: $message" >> "$receiver/wall"
	echo "OK: message posted."
	./V.sh
exit 0
fi
