#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1
else
    echo "you are running with root access"
fi
VALIDATE(){
    if [ $? -eq 0 ]
then
    echo "installing $2 is ... SUCCESS"
else
    echo "installing $2 is ... FAILURE"
fi 
}
dnf list installed mysqL
if [ $? -ne 0 ]
then
    echo "MYSQL is not installed... going to install it"
    dnf install mysql -y
    VALIDATE $? "MYSQL"    
else
    echo " MYSQL is already installed... Nothing to do"
fi  
dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed... going to install it"
    dnf install python3 -y
    VALIDATE $? "python3"    
else
    echo " python3 is already installed... Nothing to do"
fi
dnf list installed nginx
 if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install it"
    dnf install nginx -y
    VALIDATE $? "nginx"    
else
    echo " nginx is already installed... Nothing to do"
fi  
