#!/bin/bash

NO=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOG_FOLDER="/var/log/shellscript_logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"
echo "script started at : $TIMESTAMP" &>>$LOG_FILE_NAME

validate(){
    if [ $1 -ne 0 ]
        then
            echo -e "ERROR: Installation is $R failed $N...$2"
            exit 1
        else 
            echo -e " Installation $G success $N.. $2"
        fi
}

if [ $NO -ne 0 ]
then
    echo "ERROR: This is not root user"
    exit 1
fi


dnf list installed mysql &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
   then 
      dnf install mysql -y &>>$LOG_FILE_NAME
    
    validate $? "MYSQL"
        
    else
      echo -e " mysql is already $Y installed $N"
fi
dnf list installed git &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
 then
    dnf install git -y &>>$LOG_FILE_NAME
validate $? "GIT"
 else
      echo -e " Already GIT $Y installed $N"
fi
