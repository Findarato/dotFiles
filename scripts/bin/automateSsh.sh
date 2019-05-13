#!/bin/bash
# Automate the generation and distribution of keys
# https://www.ibm.com/developerworks/community/blogs/kevgrig/entry/automating_server_administration_with_ssh_keys?lang=en
#
# ssh-keygen -t rsa -b 4096 -f ~/.ssh/orchestrator.ppk
# ssh-copy-id -i ~/.ssh/orchestrator.ppk user@host
# ssh-add ~/.ssh/orchestrator.ppk

#
# Accepts username hostname, or hostname and assumes current user
#
#
#

#USER=$1
#HOST=$2
REMOTEHOST=""
REMOTEUSER=""

if [ $# -ne 2 ]
then
 REMOTEHOST="$1"
 REMOTEUSER=$LOGNAME
else
 REMOTEHOST="$2"
 REMOTEUSER="$1"
fi

if [ -f /home/$LOGNAME/.ssh/ansible.pub ];
then
  echo "Key exsists lets push it to $REMOTEUSER@$REMOTEHOST"
  ssh-copy-id -i /home/$LOGNAME/.ssh/ansible.pub "$REMOTEUSER@$REMOTEHOST"
else
  echo "need to make remote key for $REMOTEUSER@$REMOTEHOST"
  ssh-keygen -t rsa -b 4096 -f /home/$LOGNAME/.ssh/ansible
  ssh-copy-id -i /home/$LOGNAME/.ssh/ansible.pub "$REMOTEUSER@$REMOTEHOST"
fi
