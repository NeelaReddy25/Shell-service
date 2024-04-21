#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP-log

VALIDATE(){
    if [ $1 -ne o ]
    then
        echo "$2...FAILURE"
        exit 1
    else
        echo "$@...SUCCESS"
    fi        
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access"
    exit 1 #manually exit if error comes
else
    echo "You are super user"
fi

for i in $@
do 
  echo "Packages to install: $i"
  dnf list intalled $i &>>$LOGFILE
    if [ $? -eq 0]
    then
        echo "$i already installed...SKIPPING"  
    else
        echo "$i already installed...Need to install"
    fi          
done  
