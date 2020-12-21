
#!/bin/bash
#creating a script server.sh

while true; do
	mkfifo server.pipe
	read -a arr < server.pipe
	request="${arr[1]}";
	case "$request" in
		create)
		./create.sh "${arr[2]}" >& "${arr[0]}".pipe
		;;
		add)
		./add.sh "${arr[2]}" "${arr[3]}" >& "${arr[0]}".pipe
		;;
		post)
		./post.sh "${arr[2]}" "${arr[3]}" "$(echo ${arr[@]:4})" >& "${arr[0]}".pipe
		;;
		show)
		./show.sh "${arr[2]}" >& "${arr[0]}".pipe
		;;
		shutdown)
		echo "Server is shutting down.." > "${arr[0]}".pipe
		rm server.pipe
		break
		exit 0
		;;
		*)
		echo "Error: bad request"
		exit 1
		;;
	esac
	rm server.pipe
done
exit 0
