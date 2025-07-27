#!/bin/bash

echo "All variables passed to the script are: $@"
echo "Number of varaibles passed is: $#"
echo "Script name: $0"
echo "Current Directory: $PWD"
echo "User running this script: $USER"
echo "Home Directory of user: $HOME"
echo "PID of the script: $$"
sleep 10 &
scho "PID of last command in background: $!"