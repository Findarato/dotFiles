#!/usr/bin/env bash

echo -n 'Host: '
read -r drachost

echo -n 'Username: '
read -r dracuser

echo -n 'Password: '
read -r -s dracpwd
echo

#/usr/bin/java -cp avctKVM.jar -Djava.library.path=./lib com.avocent.idrac.kvm.Main ip=$drachost kmport=5900 vport=5900 user=$dracuser passwd=$dracpwd apcp=1 version=2 vmprivilege=true "helpurl=https://$drachost:443/help/contents.html"
