#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]  
then 
    echo "ERROR:: User doesn't have root previllages to run the script"
    exit 1
else
    echo "user is running with root acess"
fi

dnf list installed mysql

if [ $? -ne 0]
then 
    echo "mysql is not installed...going to install it"
    dnf install mysql -y
    if [ $? -eq 0]
    then  
        echo "mysql installation is sucessful"
    else
        echo "ERROR:: mysql istallation is not successful"
        exit 1
    fi
else
    echo "mysql has already installed....nothing to do"
fi

