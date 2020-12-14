#!/bin/bash
#creating a script server.sh

while true; do
	read -a arr;
	request=${arr[0]};

	case "$request" in
		create)
		./create.sh "${arr[1]}"
		;;
		add)
		# do something
		./add.sh "${arr[@]:1}"
		;;
		post)
		# do something
		./post.sh "${arr[@]:1}"
		;;
		show)
		# do something
		./show.sh "${arr[@]:1}"
		;;
		shutdown)
		# do something
		break
		exit 0
		;;
		*)
		echo "Error: bad request"
		exit 1
		;;
	esac
done
