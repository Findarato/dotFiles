#!/usr/bin/env bash
for i in $(virsh -q list | awk '{ print $2 }'); do
#  virsh destroy $i;
#  virsh undefine $i;
echo $i;
done;
