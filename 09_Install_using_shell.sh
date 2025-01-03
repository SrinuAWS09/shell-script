#!/bin/bash

NO=$(id -u)

if [ $NO -ne 0 ]
    echo "ERROR: This is not root user"
    exit 1
fi
dnf install git -y