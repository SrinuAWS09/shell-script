#!/bin/bash 

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}  # If user is not providing number of days, we are taking 14 as default

LOGS_FOLDER="/home/ec2-user/shellscript-logs"
LOG_FILE=$(echo $0 | awk -F "/" '{print $NF}' | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"



USAGE() 
   {
    echo -e "$R USAGE::$N sh 17-backup-script.sh <SOURCE_DIR> <DEST_DIR> <DAYS(Optional)>"
    exit 1
  }

mkdir -p /home/ec2-user/shellscript-logs

if [ $# -lt 2  ]
  then
      USAGE
fi

if [ ! -d $SOURCE_DIR ]
   then  
      echo -e "$SOURCE_DIR doesn't exit.. please check"
      exit 1
if


if [ ! -d $DEST_DIR ]
   then  
      echo -e "$DEST_DIR doesn't exit.. please check"
      exit 1
if