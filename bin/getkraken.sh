#!/bin/bash

# https://gist.github.com/pythoninthegrass/8adf67329922bbfca606523eb807c6bb



#Clean up
rm -f gitkraken-amd64.tar.gz
rm -rf ./gitkraken/

# Download GitKraken
wget https://release.gitkraken.com/linux/gitkraken-amd64.tar.gz

# Extract the Kraken
tar -xvzf gitkraken-amd64.tar.gz

# Move the Kraken
sudo rsync -va --delete-after $PWD/gitkraken/ /opt/GitKraken/

#Clean up
rm -f gitkraken-amd64.tar.gz
rm -rf ./gitkraken/

# Add the Kraken to PATH
echo "export PATH=\$PATH:/opt/GitKraken" >> ~/.zshrc
source ~/.zshrc

## Cinnamon Menu
# Right click Menu > Configure... > Open the menu editor > Applications
# Programming > New Item
# Name: GitKraken
# Command: /opt/GitKraken/gitkraken %U
# Select a suitable icon (e.g., Numix-Circle under /usr/share/icons/Numix-Circle/scalable/apps)
# OK
