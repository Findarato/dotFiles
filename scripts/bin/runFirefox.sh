#!/bin/sh
USER=firefox
KEY=~/.ssh/${USER}
IP=127.0.0.1

scp -i ${KEY} -q ~/.Xauthority ${USER}@${IP}:
ssh -i ${KEY} -l ${USER} ${IP} -X -n "DISPLAY=:0.0 \
  dbus-launch --exit-with-session
  /usr/bin/firejail \
    --private-home=.mozilla \
    --profile=/etc/firejail/firefox.profile \
    /usr/bin/firefox"
