#!/bin/bash
# Sleep Script for Control-M
# Use to Test Control-M Scheduling
# Creation Date: 2016-09-09
# Created By: David Stephenson
# Version: 1.0
exec 2> /dev/null
echo "********************************"
echo "**   CONTROL-M Environment    **"
echo "********************************"
echo PATH := $PATH
echo LD_LIBRARY_PATH:= $LD_LIBRARY_PATH
echo CONTROLM := $CONTROLM
echo ""
echo "********************************"
echo "** Arguments passed to script **"
echo "********************************"
echo Number of ARGS: = $#
echo ARGS := $*
echo ""
echo "********************************"
echo "**      Script Run times      **"
echo "********************************"
echo START := $(date)

# Default RC to 0
RC=0

# Search ARGS for RC=xxx If found Return an Error Code
while (( "$#" )); do
	arg=$(echo $1 | awk '{ print $1 }')
        if [ "$arg" -eq "$arg" ] 2>/dev/null; then
                echo SLEEP := $arg SECONDS
                sleep $1 > /dev/null
        fi
	echo $arg | grep -qi "rc=" 
	if [ "$?" -eq "0" ]; then
		RC=$(echo $arg | grep -i "rc=" | awk -F= '{ print $2 }')
		echo "RETURN CODE ARGUMENT: 'RC=$RC' FOUND. RETURN CODE '$RC' SENT TO CONTROL_M"
	fi
  shift 
done

echo END := $(date)
echo ""

exit $RC

