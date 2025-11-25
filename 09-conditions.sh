#!/bin/bash

NUMBER=$1

# -gt --> greater than
# -lt --> less than
# -eq --> equal 
# -ne --> not equal

if [ $NUMBER -lt 10 ]
then 
    echo "Given number $NUMBER is less than 10"
else 
    echo "Given number $NUMBER is greater than 10"
fi

if [ $NUMBER -eq 100 ] 
then 
    echo "Given number $NUMBER is equal to 100"
else 
    echo "Given number $NUMBER is not equal to 100"
fi    