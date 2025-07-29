#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
W="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executing at: $(date)" &>> $LOG_FILE

VALIDATE(){
    if [ $? -eq 0 ]
    then 
        echo "installing $2 is SUCCESS!" &>> $LOG_FILE
    else 
        echo -e "$R installing $2 is FAILURE!" &>> $LOG_FILE
        exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then    
    echo -e "$Y MySQL is not installed.. going to install it" &>> $LOG_FILE

    dnf install mysql -y 
    VALIDATE $? "MySQL"

else 
    echo -e "$G MySQL is already installed.. $Y nothing to do" &>> $LOG_FILE
fi

dnf list installed python3
if [ $? -ne 0 ]
then    
    echo -e "$G python3 is not installed.. $Y going to install it" &>> $LOG_FILE

    dnf install python3 -y 
    VALIDATE $? "python3"

else 
    echo -e "$Y python3 is already installed.. $Y nothing to do" &>> $LOG_FILE
fi

dnf list installed nginx
if [ $? -ne 0 ]
then    
    echo -e "$R nginx is not installed.. $Y going to install it" &>> $LOG_FILE

    dnf install nginx -y 
    VALIDATE $? "nginx"

else 
    echo -e "$G nginx is already installed.. $Y nothing to do" &>> $LOG_FILE
fi
