#!/bin/bash
#script to show the wall of user

user="$1"

if [ $# -ne 1 ]; then
	echo "Error: parameter problem." >&2
	exit 1
elif ! [ -d "$user" ]; then
	echo "Error: $user does not exist." >&2
	exit 2
else
	./P.sh "$user"
	echo "WallStart"
	cat "$user/wall"
	echo "WallEnd"
	./V.sh "$user"
exit 0
fi
