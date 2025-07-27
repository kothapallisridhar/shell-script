#!/bin/bash

VALIDATE(){
    if [ $? -eq 0 ]
    then 
        echo "installing $2 is SUCCESS!"
    else 
        echo "installing $2 is FAILURE!"
        exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then    
    echo "MySQL is not installed.. going to install it"

    dnf install mysql -y 
    VALIDATE $? "MySQL"

else 
    echo "MySQL is already installed.. nothing to do"
fi

dnf list installed python3
if [ $? -ne 0 ]
then    
    echo "python3 is not installed.. going to install it"

    dnf install python3 -y 
    VALIDATE $? "python3"

else 
    echo "python3 is already installed.. nothing to do"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then    
    echo "nginx is not installed.. going to install it"

    dnf install nginx -y 
    VALIDATE $? "nginx"

else 
    echo "nginx is already installed.. nothing to do"
fi
