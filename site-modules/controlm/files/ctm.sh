#!/bin/bash
# Startup Script for Control-M Agent Daemons
# Creation Date: 2016-09-09
# Created By: David Stephenson
# Version: 1.0

# chkconfig: 2345 99 05
# description: Controlm agent


CTM_Dir=/apps/bmc/ctm
CTM_OWNER=ctmagent
CTM_GROUP=controlm

chown $CTM_OWNER:$CTM_GROUP $CTM_Dir/proclog/*.log

case "$1" in
'start')
        cd $CTM_Dir/scripts
        ./start-ag -u $CTM_OWNER -p ALL -s
        if [ "$?" = 0 ] ; then
                touch /var/lock/subsys/ctm
                echo "Control-M Agent Started"
        fi
        ;;
'stop')
        cd $CTM_Dir/scripts
        echo "Stopping Control-M Agent"
        ./shut-ag -u $CTM_OWNER -p ALL
 RETVAL=$?
 echo
 [ $RETVAL -eq 0 ] && rm -f /var/lock/subsys/ctm;
        ;;
'mode_user')
        cd $CTM_Dir/scripts
        ./set_agent_mode -u $CTM_OWNER -o 1
        ;;
'mode_full')
        cd $CTM_Dir/scripts
        ./set_agent_mode -u $CTM_OWNER -o 2
        ;;
*)
        echo "Usage: /<install-dir>/ctm.sh { start | stop }"
        echo "or, if using sudo...."
        echo "Usage: sudo -u root ./ctm.sh { start | stop | mode_user | mode_full }"
        ;;
esac
exit 0

