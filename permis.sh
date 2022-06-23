#!/bin/bash

RIGHTS=$1
check=${#RIGHTS}
if [[ $check -ne 10 ]]; then echo "ERROR - Wrong number of characters"; exit; fi

checkletter () {
   PERMS=$1
   SUM=0
   if [[ $PERMS =~ [x] ]]; then
      SUM=$(( $SUM + 1 ))
   fi
   if [[ $PERMS =~ [w] ]]; then
      SUM=$(( $SUM + 2 ))
   fi
   if [[ $PERMS =~ [r] ]]; then
      SUM=$(( $SUM + 4 ))
   fi
   echo $SUM
}

UNO=${RIGHTS:1:3}
DOS=${RIGHTS:4:3}
TRES=${RIGHTS:7:3}

RESULT=$(checkletter $UNO;checkletter $DOS;checkletter $TRES)
echo $RESULT | sed 's/ //g'
