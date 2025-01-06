#!/bin/bash

NO=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR="/home/ec2-user/app-logs"

LOG_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f2)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"
echo "script started at : $TIMESTAMP" &>>$LOG_FILE_NAME

VALIDATE(){
    if [ $1 -ne 0 ]
        then
            echo -e "ERROR: Installation is $R failed $N...$2"
            exit 1
        else 
            echo -e " Installation $G success $N.. $2"
        fi
}
CHECK_ROOT(){

if [ $NO -ne 0 ]
then
    echo "ERROR: This is not root user"
    exit 1
fi
}

FILES_TO_DELETE=$( find $SOURCE_DIR -name "*.log" -mtime +14) &>>$LOG_FILE_NAME 
echo "Files to be deleted:$FILES_TO_DELETE" 

while read -r file

do

echo "Reading the Files: $file"

done <<< $FILES_TO_DELETE
