#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\E[0M"


if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: Please run this script with root access $N"
    exit 1
else
    echo "you are running with root access"
fi
#validate functions takes input as exit status, what command they tried to install
VALIDATE(){
    if [ $? -eq 0 ]
then
    echo  -e "installing $2 is ... $G SUCCESS $N "
else
    echo -e "installing $2 is ... $R FAILURE $N"
fi 
}
dnf list installed mysqL
if [ $? -ne 0 ]
then
    echo "MYSQL is not installed... going to install it"
    dnf install mysql -y
    VALIDATE $? "MYSQL"    
else
    echo -e "Nothing to do MYSQL... $Y already installed $N"
fi  
dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed... going to install it"
    dnf install python3 -y
    VALIDATE $? "python3"    
else
   echo -e "Nothing to do python... $Y already installed $N"
fi
dnf list installed nginx
 if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install it"
    dnf install nginx -y
    VALIDATE $? "nginx"    
else
   echo -e "Nothing to do nginx... $Y already installed $N"
fi