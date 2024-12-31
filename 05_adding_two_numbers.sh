#!/bin/bash

NUMBER1=$1
NUMBER2=$2
TIMESTAMP=$(date)
echo "time at started is : $TIMESTAMP"
sum=$(($NUMBER1+$NUMBER2))
echo "sum of two number is: $sum"
