#!/bin/bash
#creating a script server.sh

while true; do
	read -a arr;
	request="${arr[0]}";
	case "$request" in
		create)
		./create.sh "${arr[@]:1}"
		;;
		add)
		./add.sh "${arr[@]:1}"
		;;
		post)
		./post.sh "${arr[1]}" "${arr[2]}" "$(echo ${arr[@]:3})"
		;;
		show)
		./show.sh "${arr[@]:1}"
		;;
		shutdown)
		echo "Server is shutting down.."
		break
		exit 0
		;;
		*)
		echo "Error: bad request"
		exit 1
		;;
	esac
done
