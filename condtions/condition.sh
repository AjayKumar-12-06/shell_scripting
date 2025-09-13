#!/bin/bash

#installing the package

#when we are installing package we have to sudo access.

USREID=$(id -u)

if [ $USREID -ne 0 ]; then
    echo "you must have the sudo access to execute this"
    exit 1
fi

dnf list installed mysql -y

    if [ $? -ne 0 ]; then
        echo "checking the mysql avaibale or not, is not go and install"
            dnf install mysql -y
                if [ $? -ne 0 ]; then
                    echo "mysql installing ---- failure"
                else
                    echo "mysql installing --- success"
                fi
    else
        echo "mysql already installed"
    fi