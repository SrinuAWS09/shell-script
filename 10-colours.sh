#!/bin/bash

NO=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

validate(){
    if [ $1 -ne 0 ]
        then
            echo -e "ERROR: Installation is $R failed...$2"
            exit 1
        else 
            echo -e " Installation $G success.. $2"
        fi
}

if [ $NO -ne 0 ]
then
    echo "ERROR: This is not root user"
    exit 1
fi


dnf list installed mysql

if [ $? -ne 0 ]
   then 
      dnf install mysql -y
    
    validate $? "MYSQL"
        
    else
      echo -e " mysql is already $Y installed"
fi
dnf list installed git 

if [ $? -ne 0 ]
 then
    dnf install git -y
validate $? "GIT"
 else
      echo -e " Already GIT $Y installed"
fi
