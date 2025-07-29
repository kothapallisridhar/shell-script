#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
W"\e[0m"

VALIDATE(){
    if [ $? -eq 0 ]
    then 
        echo "installing $2 is SUCCESS!"
    else 
        echo "$R installing $2 is FAILURE!"
        exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then    
    echo "$Y MySQL is not installed.. going to install it"

    dnf install mysql -y 
    VALIDATE $? "MySQL"

else 
    echo "$G MySQL is already installed.. $Y nothing to do"
fi

dnf list installed python3
if [ $? -ne 0 ]
then    
    echo -e "$G python3 is not installed.. $Y going to install it"

    dnf install python3 -y 
    VALIDATE $? "python3"

else 
    echo -e "$Y python3 is already installed.. $Y nothing to do"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then    
    echo -e "$R nginx is not installed.. $Y going to install it"

    dnf install nginx -y 
    VALIDATE $? "nginx"

else 
    echo -e "$G nginx is already installed.. $Y nothing to do"
fi
