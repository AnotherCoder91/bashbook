#!/bin/bash

#Check if the user entered a valid username, create the user if needed
if [ -z "$1" ]; then
	echo "[ERROR]: Usage: client.sh <username>"
	exit
else
	client="$1"
	
	if [ -d "$client" ]; then
		echo "[SUCCESS]: Welcome back, $client!"
	else
		echo "[SUCCESS]: Welcome! User created!"
		./create.sh "$client";
	fi
fi

in_pipe=""$client"_pipe"
out_pipe="server_pipe"

# Until user exits with CTRL+C, loop
while true; do
	echo -----------------------------------
	echo Options: add, post, display
	read -p "--> " cmd usr msg

	case "$cmd" in
		add)
			if [ -z "$usr" ]; then
				echo "[ERROR]: Usage: add <username>"
			else
				if [ -d "$usr" ]; then
					sh ./add_friend.sh "$client" "$usr"
				else
					echo "[ERROR]: Cannot add. $usr doesn't exist!"
				fi
			fi
			;;
		post)
			if [ -z "$usr" ] || [ -z "$msg" ]; then
				echo "[ERROR]: Usage: post <username> <message>"
			else
				if [ -d "$usr" ]; then
					sh ./post_message.sh "$client" "$usr" "$msg"
				else
					echo "[ERROR]: $usr doesn't exist!"
				fi
			fi
			;;
		display)
			if [ -z "$usr" ]; then
				echo "[ERROR]: Usage: display <username>"
			else
				if [ -d "$usr" ]; then
					sh display_wall.sh "$usr"
				else
					echo "[ERROR]: $usr doesn't exist!"
				fi
			fi
			;;
		*)
			echo "[ERROR]: Invalid command"
			;;
	esac
done
