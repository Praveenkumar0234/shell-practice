#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


USERID=$(id -u)

if [ $USERID -ne 0 ]  
then 
    echo -e "$R ERROR:: User doesn't have root previllages to run the script $N"
    exit 1
else
    echo -e  "$G user is running with root acess $N"
fi

VALIDATE () {
if [ $1 -eq 0 ]
    then  
        echo -e "$G $2 installation is sucessful $N"
    else
        echo -e "$R ERROR:: $2 istallation is not successful $N"
        exit 1
    fi
}

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo -e "$Y mysql is not installed...going to install it $N"
    dnf install mysql -y
    validate $? "mysql"
else
    echo -e "$Y mysql has already installed....nothing to do $N"
fi


dnf list installed nginx

if [ $? -ne 0 ]
then 
    echo -e "$Y nginx is not installed...going to install it $G"
    dnf install nginx -y
    validate $? "nginx"
else
    echo -e "$Y nginx has already installed....nothing to do $N"
fi


dnf list installed python3

if [ $? -ne 0 ]
then 
    echo -e "$Y python is not installed...going to install it $N"
    dnf install python3 -y
    validate $? "python"
else
    echo -e "$Y python has already installed....nothing to do $N"
fi

