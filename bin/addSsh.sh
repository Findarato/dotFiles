#!/bin/bash
cd /tmp
USER=it
TMP=hots.tmp
# create hosts
#echo rpi1 > hosts
#echo rpi2 >> hosts
#echo rpi3 >> hosts
#echo rpits01 >> hosts
#echo rpits02 >> hosts
#echo rpits03 >> hosts
#echo rpits04 >> hosts
#echo rpihs01 >> hosts
echo classroom01.classroom.library.wpl.lib.in.us >> $TMP
echo classroom02.classroom.library.wpl.lib.in.us >> $TMP
echo classroom03.classroom.library.wpl.lib.in.us >> $TMP
echo classroom04.classroom.library.wpl.lib.in.us >> $TMP
echo classroom05.classroom.library.wpl.lib.in.us >> $TMP
echo classroom06.classroom.library.wpl.lib.in.us >> $TMP
echo classroom07.classroom.library.wpl.lib.in.us >> $TMP
echo classroom08.classroom.library.wpl.lib.in.us >> $TMP
echo classroom09.classroom.library.wpl.lib.in.us >> $TMP
echo classroom10.classroom.library.wpl.lib.in.us >> $TMP
echo classroom11.classroom.library.wpl.lib.in.us >> $TMP
echo classroom12.classroom.library.wpl.lib.in.us >> $TMP
echo classroom13.classroom.library.wpl.lib.in.us >> $TMP
echo classroom14.classroom.library.wpl.lib.in.us >> $TMP
echo classroom15.classroom.library.wpl.lib.in.us >> $TMP
echo classroom16.classroom.library.wpl.lib.in.us >> $TMP
echo classroom17.classroom.library.wpl.lib.in.us >> $TMP
echo classroom18.classroom.library.wpl.lib.in.us >> $TMP




# grab IP addresses from hosts
for NODE in $(cat $TMP); do
  nslookup $NODE | grep 'Address\:' | awk 'NR==2 {print $2}' >> hosts
done

# add ssh keys for both hostname and ip for each host
for NODE in $(cat $TMP); do
  ssh-keyscan -H $NODE >> ~/.ssh/known_hosts
  ssh-copy-id -i ~/.ssh/ansible.pub $USER@$NODE
done

# Cleanup known_hosts for duplicate entries
sort -u ~/.ssh/known_hosts > ~/.ssh/known_hosts.clean
mv ~/.ssh/known_hosts ~/.ssh/known_hosts.backup
cp ~/.ssh/known_hosts.clean ~/.ssh/known_hosts
rm -f $TMP


# make sure destination exists and is writable for rundeck user... This was erroring out with permission denied for rundeck user.
#sudo mkdir /var/lib/rundeck/.ansible/
#sudo chown -R rundeck:rundeck /var/lib/rundeck/.ansible/
#cd /tmp/ansible
#ansible-playbook -i hosts ansible-test.yml --user rundeck
