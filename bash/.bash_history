sudo dnf update -y
sudo dnf install pidgin
wget https://raw.githubusercontent.com/Findarato/Ansible-Workstation/master/fedoraSetup.sh
chmod +x fedoraSetup.sh 
./fedoraSetup.sh 
dnf search groupwise
cd /etc/yum.repos.d/
sudo wget https://yum.enpass.io/enpass-yum.repo
sudo dnf update -ty
sudo dnf update -y
sudo dnf -y install enpass
cd ~
nano .vault_pass.txt
vi .vault_pass.txt
ls
nano fedoraSetup.sh 
sudo dnf install nano -y
dnf install chrome-gnome-shell
sudo dnf install chrome-gnome-shell
sudo hostnamectl set-hostname iti170
https://download.fedoraproject.org/pub/fedora/linux/releases/29/Workstation/x86_64/iso/Fedora-Workstation-Live-x86_64-29-1.2.iso
wget  https://download.fedoraproject.org/pub/fedora/linux/releases/29/Workstation/x86_64/iso/Fedora-Workstation-Live-x86_64-29-1.2.iso
wget -c https://download.fedoraproject.org/pub/fedora/linux/releases/29/Workstation/x86_64/iso/Fedora-Workstation-Live-x86_64-29-1.2.iso
cd setup/
ls
cd Ansible-Workstaton/
ls
code
la
ls
nano fedoraSetup.sh 
ansible-playbook -i localHosts deploy.yml --extra-vars "local_user=$USER"
dnf search python-selinux
dnf search  libselinux-python
dnf search  selinux-python
dnf search  selinux
dnf search  selinux | grep python
dnf install python2-libselinux
sudo dnf install python2-libselinux
ansible-playbook -i localHosts deploy.yml --extra-vars "local_user=$USER"
exit
zsh
exit
htop
clear
cd setup/
ls
cd Ansible-Workstaton/
ls
code .
git status
tracker daemon -t
docker ps
htop
top
clear
1
curl -s ifconfig.me
ansible-vault e vars/vault.yml 
ansible-vault edit vars/vault.yml 
ls /mnt/
ls
sudo mkdir /mnt/backups
ls -la /mnt/
sudo mount -a
dnf search rofi
sudo reboot
firefox/firefox --profile
./firefox/firefox --profile
./firefox/firefox
ls
cd firefox
ls
./firefox-bin --help
./firefox-bin
ll
./firefox
cd /mnt/
ls
sudo mkdir {scripts,install,epicra}
sudo mount -t nfs mitcvn/perl_scripts scripts/
sudo mount -t nfs mitcvn:perl_scripts scripts/
ping mitcvnx
sudo mount -t nfs mitcvnx:perl_scripts scripts/
ls
cd scripts/
ls
cd nagios/
ls
cd ..
ls
cd backup/
ls
cd ..
sudo nano /etc/fstab 
cd /mnt/
ls
ll
sudo mount backups/
ls
ll
cd backups/
ls
ll
cd snapshots/
ls
cd ..
ls
cd ..
ls
cd scripts/
ls
cd backup/
ls
nano backup.pl 
ls
cd ..
ls
cd admin/
ls
ll
cd ..
ls
cd powershell/
ls
cd ..
ls
cd refresh/
ls
ll
nano refresh.pl 
cd lo
cd logs/
ls
ll
cd COP
ls
ll
cat refresh.2017.COP.20190130 
cat refresh.2017.COP.20190130  | less
clear
cd ~
java --version
java -b
java -v
java
java -version
/usr/sbin/alternatives --config java
sudo rpm -Uvh Downloads/jre-8u201-linux-i586.rpm 
cd /usr/java/
ls
rpm -ivh ~/Downloads/jre-8u201-linux-i586.rpm 
sudo rpm -ivh ~/Downloads/jre-8u201-linux-i586.rpm 
sudo rpm -Uvh ~/Downloads/jre-8u201-linux-i586.rpm 
sudo rpm -e ~/Downloads/jre-8u201-linux-i586.rpm 
/usr/sbin/alternatives --config java
sudo /usr/sbin/alternatives --config java
java -version
/usr/java/jre1.8.0_201-i586/bin/java -version
/usr/java/jre1.8.0_201-i586/bin/java
cd /usr/java/jre1.8.0_201-i586/bin/
ls
./java
ll
sudo -i
cd ~
basename
cp
clear
ls
cd Downloads/
ls
sudo dnf install ./jre-8u201-linux-i586.rpm 
dnf install libnsl
sudo dnf install libnsl
/usr/sbin/alternatives --config java
ls
rm -f jre-8u201-linux-i586*
ls
sudo rpm -Uvh ~/Downloads/jre-8u202-linux-i586.rpm 
du -H
df --si
ls
sudo rpm -Uvh jre-8u202-linux-x64.rpm 
java -version
/usr/sbin/alternatives --config java
sudo /usr/sbin/alternatives --config java
java -version
clear
sudo /usr/sbin/alternatives --config java
/usr/sbin/update-alternatives --config java
/usr/sbin/update-alternatives --remove "java" "/usr/java/jre1.8.0_202-i586/bin/java"
sudo /usr/sbin/update-alternatives --remove "java" "/usr/java/jre1.8.0_202-i586/bin/java"
cat /var/lib/alternatives/java 
cd /usr/java/latest/bin/
ls
ll
./java -version
ll
sudo ./java
cd ~
/usr/sbin/update-alternatives --config java
sudo /usr/sbin/update-alternatives --remove "java" "/usr/java/latest/bin/java"
/usr/sbin/update-alternatives --config javaws
javaws 
ls
cd webex/
ls
git clone https://github.com/fgsch/docker-webex.git
ls
cd docker-webex/
ls
./webex.sh 
clear
sudo dnf remove docker                   docker-client                   docker-client-latest                   docker-common                   docker-latest                   docker-latest-logrotate                   docker-logrotate                   docker-selinux                   docker-engine-selinux                   docker-engine
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager     --add-repo     https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker jharry
sudo docker run hello-world
ls
./webex.sh 
id -g
newgrp docker
id -g
id
ls
./webex.sh 
clear
cd ~
ls
mkdir bin
ls
rm -f Fedora-Workstation-Live-x86_64-29-1.2.iso 
clear
sudo dnf install openjdk-8:8386
sudo dnf install openjdk-8:i386
dnf search openjdk
dnf search groupwise
glatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install https://flathub.org/repo/appstream/org.signal.Signal.flatpakref
dnf search gbt
sudo -s
dnf install go
sudo dnf install go
ls
cd ~
cd /mnt/home/
ls
go get -u github.com/jtyr/gbt/cmd/gbt
ls
go install github.com/jtyr/gbt/cmd/gbt
gbt
cd ~
exit
fakse
false
true
clear
cd /
cd /usr/share/doc/
ls
export GBT_CAR_DIR_DEPTH=4
export GBT_CAR_TIME_FORMAT=' {{ Time }} '
export GBT_CARS='Status, Os, Time, Hostname, Dir, Sign'
cd ~
cd Documents/src/
ls
cd dotFiles/
ls
export GBT_CARS='Status, Os, Time, Hostname, Dir, Sign git'
ls
gs
export GBT_CARS='Status, Os, Time, Hostname, Dir, Sign,git'
ls
cd ..
ls
cd dotFiles/
ls
export GBT_CARS='Status, Os, Time, Hostname, Dir, Git, Sign'
ls
export GBT_CARS='Status, Os, Hostname, Dir, Git, Sign'
export GBT_CAR_GIT_FORMAT=' {{ Icon }} {{ Head }} {{ Status }}{{ Ahead }}{{ Behind }} '
gs
exit
screen
su
sudo 
exit
sudo 
ls
source sources/gbts/cmd/local.sh 
nano source sources/gbts/cmd/local.sh 
nano sources/gbts/cmd/local.sh 
exit
sudo 
dnf install dwm
sudo dnf install dwm
exit
clear
ls
cd ~
ls
cd bin
ls
gs
cd ~
haxor-news 
nano ~/.haxornews
hn new
hn new 15
hn view 2
hn view 2 -b
box colors
hn view 2 -b
hn show
hn view 1 -b
hn onion
hn view 18
ls
ls -la
nano .bashrc 
export GBT_CAR_OS_NAME='fedora'
export GBT_CAR_OS_NAME='Fedora'
export GBT_CAR_OS_NAME='Ubuntu'
export GBT_CAR_OS_NAME='fedora'
export GBT_CAR_OS_NAME='cloud'
export GBT_CAR_OS_NAME='fedora'
export GBT_CAR_OS_NAME='linux'
clear
ls
export GBT_CAR_OS_NAME='fedora'
fc-cache -f -v
dnf search hack-fonts
sudo dnf install dnf-plugins-core :: heliocastro/hack-fonts :: hack-fonts
clear
sudo -s
sudo dnf search gbt
dnf install gbt
sudo dnf install gbt
sudo dnf reinstall gbt
ls /usr/share/gbt
bash
cd ..
cd ~
sudo dnf remove gbt
zsh
exit
dnf update -y
sudo dnf update -y
ping google.com
wget google.com
ls
cat index.html 
rm -f index.html 
ls
./noti test
clear
exit
hash gbt
gbt
exit
zsh
ls
systemctl
sudo reboot
exit
ls
cd /var/ww
ls
cd /var/
ls
sudo dnf install php httpd 
sudo systemctl start httpd
sudo systemctl 
systemctl 
bash
exit
systemctl
sudo reboot
exit
