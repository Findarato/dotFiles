#!/bin/bash

# https://gist.github.com/pythoninthegrass/8adf67329922bbfca606523eb807c6bb

<<<<<<< HEAD
DATA_DIR="/usr/share/GitKraken"
GLOBAL_ICON_DIR="/usr/share/icons/hicolor"
DOWNLOAD_DIR=$PWD/gitkraken/
=======
>>>>>>> 7f25d129095cf334f1d624ffb16531b43ff126ac

#Clean up
rm -f $PWD/GitKraken.tar.gz
rm -rf $DATA_DIR/*
rm -rf $DOWNLOAD_DIR
rm -f $PWD/gitkraken.desktop

# Download GitKraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.tar.gz -O $PWD/GitKraken.tar.gz
wget https://raw.githubusercontent.com/Findarato/GitKraken/master/gitkraken.desktop -O /usr/share/applications/gitkraken.desktop

# Extract the Kraken
tar -xvzf $PWD/GitKraken.tar.gz

# Move the Kraken
<<<<<<< HEAD
sudo rsync -va --delete-after $DOWNLOAD_DIR $DATA_DIR/
=======
sudo rsync -va --delete-after ./gitkraken/ /opt/GitKraken/

>>>>>>> 7f25d129095cf334f1d624ffb16531b43ff126ac

#Clean up
rm -f gitkraken-amd64.tar.gz
rm -rf $PWD/gitkraken/




<<<<<<< HEAD
=======
# Add the Kraken to PATH
echo "export PATH=\$PATH:/opt/GitKraken" >> ~/.bashrc
source ~/.bashrc
>>>>>>> 7f25d129095cf334f1d624ffb16531b43ff126ac

## Cinnamon Menu
# Right click Menu > Configure... > Open the menu editor > Applications
# Programming > New Item
# Name: GitKraken
# Command: /opt/GitKraken/gitkraken %U
# Select a suitable icon (e.g., Numix-Circle under /usr/share/icons/Numix-Circle/scalable/apps)
# OK
