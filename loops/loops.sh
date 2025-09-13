#!/bin/bash

#!/bin/bash

# checking the user have the have the sudo acess are not

USERID=$(id -u)

#logs

LOG_FOLDER="/var/log/shell_script.log"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"

mkdir -p $LOG_FOLDER


# colors
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo -e " $R you must have the sudo access to execute this $N"
    exit 1
fi

echo "code execute from the :$TIMESTAMP" &>>$LOG_FILE_NAME
validate() {
    if [ $1 -ne 0 ]; then
        echo -e "$2 installing ---$R Failure $N"
    else
        echo -e "$2 installing ----$G Success $N"
    fi
}
#installing packages

for packages in $@
do 
    dnf list installed $packages -y &>>$LOG_FILE_NAME
        if [ $? -ne 0 ]; then
            dnf install $packages -y &>>$LOG_FILE_NAME
                validate $? "$packages installing"
        else
            echo -e " $y already $package installed $N"
        fi
done