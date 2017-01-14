sudo sshfs -o allow_other,IdentityFile=/home/joe/.ssh/remote joe@192.168.1.12:/var/www/html/ /mnt/wpl-stats/
#sshfs -o IdentityFile=/home/joe/.ssh/remote,auto_cache,reconnect joe@wpl-stats:/var/www/html/ /mnt/wpl-stats
