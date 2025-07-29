#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
W="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "python" "nginx" "httpd")

mkdir -p $LOGS_FOLDER
echo "Script started executing at: $(date)" | tee -a  $LOG_FILE

VALIDATE(){
    if [ $? -eq 0 ]
    then 
        echo "installing $2 is SUCCESS!" | tee -a  $LOG_FILE
    else 
        echo -e "$R installing $2 is FAILURE!" | tee -a  $LOG_FILE
        exit 1
    fi
}

//for package in ${PACKAGES[@]}
for package in $@
do 
    dnf list installed $package &>> $LOG_FILE
    if [ $? -ne 0 ]
    then 
        echo -e "$Y $package is not installed.. going to install it" | tee -a  $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package"
    else     
        echo -e "Nothing to do $package... $Y already installed $W" | tee -a  $LOG_FILE
    fi
done

