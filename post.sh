#!/bin/bash
#creating to make a message to the friends wall

receiver=$1
sender=$2
message=$3

if [ $# -ne 3 ]; then
	echo "Error: parameters problem." >&2
	exit 1
elif ! [ -d ~/comp30640project/project-faye-a/users/"$receiver" ]; then
	echo "Error: Receiver $receiver does not exist." >&2
	exit 2
elif ! [ -d ~/comp30640project/project-faye-a/users/"$sender" ]; then
	echo "Error: Sender $sender does not exist." >&2
	exit 3
elif ! [ -d ~/comp30640project/project-faye-a/users/"$receiver"/friends/"$sender" ]; then
	echo "Error: Sender $sender is not friends with $receiver" >&2
	exit 4
else
cd ~/comp30640project/project-faye-a/users/"$receiver"
echo "$sender : $message" >> ~/comp30640project/project-faye-a/users/"$receiver"/wall.txt
echo "OK: message received."
exit 0
fi
