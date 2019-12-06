#!/bin/bash

tracker daemon -t
mkdir -p ~/.config/autostart/
cp /etc/xdg/autostart/tracker* ~/.config/autostart/
sed -i 's/X-GNOME-Autostart-enabled=true/X-GNOME-Autostart-enabled=false/' ~/.config/autostart/tracker*
