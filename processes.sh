#!/bin/bash

echo "Sort process by:"
echo "1. CPU consumption"
echo "2. Memory consumption"


read -p "Enter your preference 1 or 2?:  "  choice

echo "\n"

read -p "Enter a limit to output(an Integer): "  limit

case "$choice" in
	1) sorting_key="-pcpu" ;;
	2) sorting_key="-pmem" ;;
	*)
		echo "Invalid input. Using CPU consumption as the key"
		sorting_key="-pcpu"
		;;
esac

ps aux --sort="$sorting_key"| grep $USER | head -n "$limit"
