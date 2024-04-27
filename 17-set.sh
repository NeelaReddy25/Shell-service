#!/bin/bash

set -e

failure(){
    echo "Failed at $1: $2"
}

trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

USERID=$(id -u)

if [ $USERID -ne 0 ] #ERR
then 
    echo "Please run this script with root access."
    exit 1 #manually exit if error comes.
else
    echo "You are super user."

fi

dnf install mysql -y &>>$LOGFILE
dnf install git -y &>>$LOGFILE

echo "is script proceeding?"