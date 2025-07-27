#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR:: Please run the script with root access"
    exit 1 # gives other than 0 upto 127
else 
    echo "You are running with root access"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then    
    echo "MySQL is not installed.. going to install it"

    dnf install mysql -y 

    if [ $? -eq 0 ]
    then 
        echo "installing MySql is success!"
    else 
        echo "installing MySql is failure!"
        exit 1
    fi
else 
    echo "MySQL is already installed.. nothing to do"
fi

