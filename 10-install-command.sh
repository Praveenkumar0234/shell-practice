#!/bin/bash


#run with root access
#install mysql 

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR:: please run this script with root access"
    exit 1
else
    echo "you are running with root access"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "mysql is not insatlled...going to instll it"
    dnf install mysql -y
    if [ $? -eq 0 ]
then
    echo "Istalling MySQL is ......Success"
else
    echo "insatlling MySQL is .......Failure"
    exit 1
fi
else
    echo "mysql is already installed...nothing to do"
fi




