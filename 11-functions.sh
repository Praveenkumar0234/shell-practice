#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]  
then 
    echo "ERROR:: User doesn't have root previllages to run the script"
    exit 1
else
    echo "user is running with root acess"
fi

VALIDATE () {
if [ $! -eq 0 ]
    then  
        echo "$2 installation is sucessful"
    else
        echo "ERROR:: $2 istallation is not successful"
        exit 1
    fi
}

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "mysql is not installed...going to install it"
    dnf install mysql -y
    validate $1 "mysql"
else
    echo "mysql has already installed....nothing to do"
fi


dnf list installed nginx

if [ $? -ne 0 ]
then 
    echo "nginx is not installed...going to install it"
    dnf install nginx -y
    validate $1 "nginx"
else
    echo "nginx has already installed....nothing to do"
fi


dnf list installed python3

if [ $? -ne 0 ]
then 
    echo "python is not installed...going to install it"
    dnf install python3 -y
    validate $1 "python"
else
    echo "python has already installed....nothing to do"
fi

