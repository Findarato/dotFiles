echo ""
echo "This will install Pop OS Theme on your Fedora"
echo "This will take some times to install"
cd /tmp
sudo dnf install inkscape optipng gtk-murrine-engine sassc
git clone https://github.com/pop-os/gtk-theme.git
cd gtk-theme
make
make assets
sudo make install
echo "Installation completed"
echo ""
echo "Use Gnome Tweak Tool to apply this theme"
echo ""
echo "Please visit http://manjaro.site"
