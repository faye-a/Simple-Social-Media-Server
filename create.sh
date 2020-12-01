#!/bin/bash
# script to create a new user

user=$1
if [ $# -ne 1 ]; then
	echo "Error: parameters problem." >&2
exit 1
elif [ -d ~/comp30640project/project-faye-a/users/"$user" ]; then
	echo "Error: user already exists." >&2
exit 2
else
	cd ~/comp30640project/project-faye-a/users
	mkdir "$user"
	cd ~/comp30640project/project-faye-a/users/"$user"
	> wall
	mkdir friends
	echo "OK: Directory created."
exit 0
fi
