#!/bin/bash

echo "All variables passed to the script are: $@"
echo "Number of varaibles passed is: $#"
echo "Script name: $0"
echo "Current Directory: $PWD"
echo "User running this script: $USER"
echo "Home Directory of user: $HOME"
echo "PID of the script: $$"
sleep 10 &
echo "PID of last command in background: $!"
wait $!
echo "Line number: $LINENO"
echo "Script executed in $SECONDS seconds"
echo "Random number: $RANDOM"

# $? will gieve the exit code of previous command
# exit code 0: success 1-127: failure

echo "Exit code of previous command is: $?"