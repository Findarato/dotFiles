tracker daemon -t
cp /etc/xdg/autostart/tracker* ~/.config/autostart/
sed -i 's/X-GNOME-Autostart-enabled=true/X-GNOME-Autostart-enabled=false/' ~/.config/autostart/tracker*
