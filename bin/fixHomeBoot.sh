sudo /sbin/efibootmgr -c -d /dev/sdb -p 1 -L fedora -l \EFI\fedora\grubx64.efi
sudo /sbin/efibootmgr -b 2 -a
sudo efibootmgr -o

