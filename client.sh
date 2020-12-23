#!/bin/bash
#creating client.sh
id="$1"
req="$2"
user="$3"
friend="$4"
message="$5"

#error checking
if [ "$#" -lt 2 ]; then
	echo "Error: parameters problem." >&2
	exit 1

elif [[ -p "$id".pipe ]]; then
	echo "Error. $id.pipe already exists. Could not execute the command." >&2
	exit 3

elif [[ "$req" == "create" ]]; then
	mkfifo "$id".pipe
	echo "$id $req $user" > server.pipe
elif [[ "$req" == "add" ]]; then
	 mkfifo "$id".pipe
	echo "$id $req $user $friend" > server.pipe
elif [[ "$req" == "post" ]]; then
	 mkfifo "$id".pipe
	echo "$id $req $user $friend $message" > server.pipe
elif [[ "$req" == "show" ]]; then
	 mkfifo "$id".pipe
	echo "$id $req $user" > server.pipe
elif [[ "$req" == "shutdown" ]]; then
	 mkfifo "$id".pipe
	echo "$id $req" > server.pipe
else
	echo "Error. $req not recognised." >&2
	exit 4
fi

#reading output of serverpipe...
while read output; do
	echo "$output"
	break
done < "$id".pipe
rm "$id".pipe
exit 0
