#!/bin/bash 

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # if user is not providing number of days, we are taking 14 as default

LOGS_FOLDER="/home/ec2-user/shellscript-logs"
LOG_FILE=$(echo $0 | awk -F "/" '{print $NF}' | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

USAGE(){
    #echo -e "$R USAGE:: $N sh 18-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS(Optional)>"
    echo -e "$R USAGE:: $N backup <SOURCE_DIR> <DEST_DIR> <DAYS(Optional)>"
    exit 1
}

mkdir -p /home/ec2-user/shellscript-logs

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d "$SOURCE_DIR" ]
then
    echo -e "$SOURCE_DIR Does not exist...Please check"
    exit 1
fi

if [ ! -d "$DEST_DIR" ]
then
    echo -e "$DEST_DIR Does not exist...Please check"
    exit 1
fi

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

FILE=$( find $SOURCE_DIR -name "*.log" -mtime +$DAYS)
if [ -n "$FILE" ]
  then
     echo "Files are:$FILE"
     ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
     find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"
     if [ -f "$ZIP_FILE" ]
        then 
            echo "Successfully fils are ziped"
            while read -r filepath
            do 
              echo "Deleting the file :$filepath" &>>LOG_FILE_NAME
              rm -fr $filepath
              echo "delted files: $filepath "
            done <<< $FILE
     else
            echo -e "$R Failed to zip $N the files"
            exit 1
     fi        

else
      echo "No files are there older than $DAYS to zip"
fi

