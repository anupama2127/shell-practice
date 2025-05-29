#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1
else
    echo "you are running with root access"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MYSQL is not installed... going to install it"
    dnf install mysql -y

if [ $? -eq 0 ]
then
    echo "installing mysql is ... SUCCESS"
else
    echo "installing mysql is ... FAILURE"
fi    
else
    echo " MYSQL is already installed... Nothing to do"
fi        
