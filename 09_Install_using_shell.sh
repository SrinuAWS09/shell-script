#!/bin/bash

NO=$(id -u)

validate(){
    if [ $1 -ne 0 ]
        then
            echo "ERROR: Installation is failed...$2"
            exit 1
        else 
            echo " Installation success.. $2"
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
      echo " mysql is already installed"
fi
dnf list installed git 

if [ $? -ne 0 ]
 then
    dnf install git -y
validate $? "GIT"
 else
      echo " Already GIT installed"
fi
