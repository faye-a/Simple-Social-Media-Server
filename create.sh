#!/bin/bash
# script to create a new user

user="$1"
if [ $# -ne 1 ]; then
	echo "Error: parameters problem." >&2
exit 1
elif [ -d "$user" ]; then
	echo "Error: user already exists." >&2
exit 2
else
	./P.sh
	mkdir "$user"
	touch "$user/wall"
	touch "$user/friends"
	echo "OK: Directory created."
	./V.sh
exit 0
fi
