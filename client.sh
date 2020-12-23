#!/bin/bash
#creating client.sh
id="$1"
req="$2"
user="$3"
friend="$4"
message="$5"
array=("create" "add" "post" "show" "shutdown")

#error checking
if [ "$#" -lt 2 ]; then
	echo "Error: parameters problem." >&2
	rm "$id".pipe
	exit 1
elif [[ ! "${array[$req]}" ]]; then
	echo "Error. $req Command not recognised." >&2
	rm "$id".pipe
	exit 2

elif [[ -p "$id".pipe ]]; then
	echo "Error. $id.pipe already exists. Could not execute the command." >&2
	exit 3
else
	mkfifo "$id".pipe

	if [[ "$req" == "create" ]]; then
		echo "$id $req $user" > server.pipe
	elif [[ "$req" == "add" ]]; then
		echo "$id $req $user $friend" > server.pipe
	elif [[ "$req" == "post" ]]; then
		echo "$id $req $user $friend  $message" > server.pipe
	elif [[ "$req" == "show" ]]; then
		echo "$id $req $user" > server.pipe
	elif [[ "$req" == "shutdown" ]]; then
		echo "$id $req" > server.pipe
	fi
fi

#reading output of serverpipe...
while read output; do
	echo "$output"
	break
done < "$id".pipe
rm "$id".pipe
exit 0


