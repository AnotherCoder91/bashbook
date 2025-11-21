#!/bin/bash

# Until user exits with CTRL+C, loop
while true; do
	echo -----------------------------------
	echo Options: create, add, post, display
	read -p "--> " request
	case "$request" in
		create)
			echo Enter name of user to create: 
			read -p "--> " name
			sh ./create.sh "$name"
			;;
		add)
			echo Enter your username: 
			read -p "--> " sender
			echo Enter user to add: 
			read -p "--> " reciever
			sh ./add_friend.sh "$sender" "$reciever"
			;;
		post)
			echo Enter your username:
			read -p "--> " sender
			echo Enter user to post to: 
			read -p "--> " reciever
			echo Enter message: 
			read -p "--> "  message
			sh ./post_message.sh "$sender" "$reciever" "$message"
			;;
		display)
			echo Enter user whose wall to display:
			read -p "--> " name
			sh display_wall.sh "$name"
			;;
		*)
			echo Invalid command
			;;
	esac
done
