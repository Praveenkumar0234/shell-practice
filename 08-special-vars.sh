#!/bin?bash

echo "All varaiables paased to the script: $@"
echo "number of varaiables in the script: $#"
echo "script name: $0"
echo "current directory: $PWD"
echo "user running the script: $USER"
echo "home directory of the user: $HOME"
echo "PID of the script: $$"
sleep 10 &
echo "PID of the last command running on the background: $!"
echo "check last command is succesful or not 0 for success 1-127 is failure $?"


