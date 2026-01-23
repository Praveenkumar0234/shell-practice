#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


USERID=$(id -u)

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("nginx" "mysql" "python3" "httpd")

mkdir -p $LOGS_FOLDER

echo -e "$Y script executed at: $(date) $N" | tee -a $LOG_FILE


if [ $USERID -ne 0 ]  
then 
    echo -e "$R ERROR:: User doesn't have root previllages to run the script $N" | tee -a $LOG_FILE
    exit 1
else
    echo -e  "$G user is running with root acess $N" | tee -a $LOG_FILE
fi

VALIDATE () {
if [ $1 -eq 0 ]
    then  
        echo -e "$G $2 installation is sucessful $N" | tee -a $LOG_FILE
    else
        echo -e "$R ERROR:: $2 istallation is not successful $N" | tee -a $LOG_FILE
        exit 1
    fi
}

for pacakage in {$PACKAGES[@]}
do
   if [ $? -ne 0 ]
    then 
    echo -e "$Y $pacakage is not installed...going to install it $N" | tee -a $LOG_FILE
    dnf install $pacakage -y &>>$LOG_FILE
    VALIDATE $? "$pacakage"
    else
    echo -e "$Y $pacakage has already installed....nothing to do $N" | tee -a $LOG_FILE
fi 
done


# dnf list installed mysql &>>$LOG_FILE

# if [ $? -ne 0 ]
# then 
#     echo -e "$Y mysql is not installed...going to install it $N" | tee -a $LOG_FILE
#     dnf install mysql -y &>>$LOG_FILE
#     VALIDATE $? "mysql"
# else
#     echo -e "$Y mysql has already installed....nothing to do $N" | tee -a $LOG_FILE
# fi


# dnf list installed nginx &>>$LOG_FILE

# if [ $? -ne 0 ]
# then 
#     echo -e "$Y nginx is not installed...going to install it $G" | tee -a $LOG_FILE
#     dnf install nginx -y &>>$LOG_FILE
#     VALIDATE $? "nginx"
# else
#     echo -e "$Y nginx has already installed....nothing to do $N" | tee -a $LOG_FILE
# fi


# dnf list installed python3 &>>$LOG_FILE

# if [ $? -ne 0 ]
# then 
#     echo -e "$Y python is not installed...going to install it $N" | tee -a $LOG_FILE
#     dnf install python3 -y &>>$LOG_FILE
#     VALIDATE $? "python"
# else
#     echo -e "$Y python has already installed....nothing to do $N" | tee -a $LOG_FILE
# fi

