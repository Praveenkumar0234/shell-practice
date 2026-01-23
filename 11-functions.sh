#!/bin/bash

USERDID=$(id -u)

if [ i$USERID -ne 0 ]
then 
    echo "ERROR:: User doesn't have root previllages to run the script"
    exit 1
else
    echo "user is running with root acess"
fi

