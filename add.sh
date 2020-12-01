#!/bin/bash
#script to add a new friend

user=$1
friend=$2

if [ $# -ne 2 ]; then
	echo "Error: parameters problem" >&2
	exit 1
elif ! [ -d ~/comp30640project/project-faye-a/users/"$user" ]; then
	echo "Error: $user does not exist." >&2
	exit 2
elif ! [ -d ~/comp30640project/project-faye-a/users/"$friend" ]; then
	echo "Error: $friend does not exist." >&2
	exit 3
elif [ -d ~/comp30640project/project-faye-a/users/"$user"/friends/"$friend" ]; then
	echo "Error: $friend and $user are already friends." >&2
	exit 4
else
cd ~/comp30640project/project-faye-a/users
cp -r "$friend" ~/comp30640project/project-faye-a/users/"$user"/friends
echo "OK: friend added."
exit 0
fi
