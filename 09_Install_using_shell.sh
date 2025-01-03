#!/bin/bash

NO=$(id -u)

if [ $NO -ne 0 ]
then
    echo "ERROR: This is not root user"
    exit 1
fi
dnf install mysql -y
if [ $? -ne 0 ]
 then
     echo "ERROR: Installation is failed...MYSQL"
     exit 1
else 
     echo " Installation success.. MYSQL"
fi
dnf install git -y

if [ $? -ne 0 ]
 then
     echo "ERROR: Installation is failed...GIT"
     exit 1
else 
     echo " Installation success.. GIT"
fi


