#!/bin/bash

#Check if user exists
if ! ls | grep -w "$1" > /dev/null; then
	#User does not exist
	echo nok: User "$1" does not exist
else
	#Print wall	
	echo start_of_file
	cat ./"$1"/wall.txt
	echo end_of_file
fi
