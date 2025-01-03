#!/bin/bash

NO=$(id -u)

if [ $NO -ne 0 ]
then
    echo "ERROR: This is not root user"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
   then 
      dnf install mysql -y
    
        if [ $? -ne 0 ]
        then
            echo "ERROR: Installation is failed...MYSQL"
            exit 1
        else 
            echo " Installation success.. MYSQL"
        fi
    else
      echo " mysql is already installed"
fi
dnf list installed git 

if [ $? -ne 0]
 then
    dnf install git -y

        if [ $? -ne 0 ]
        then
            echo "ERROR: Installation is failed...GIT"
            exit 1
        else 
            echo " Installation success.. GIT"
        fi
 else
      echo " Already GIT installed"
fi
