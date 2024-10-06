echo "no !  don't run it"
exit 1

#sudo sed -i -e 's/GRUB_CMDLINE_LINUX=\"\"/GRUB_CMDLINE_LINUX=\"console=ttyS0\"/g' /etc/default/grub

remove_snap() {
wsl=$(cat /etc/*release* | grep -i wsl | wc -l)
if [ $wsl -ne 0 ]
then
# TODO
    sudo snap remove gtk-common-themes
    sudo snap remove ubuntu-desktop-installer
    sudo snap remove core22
    sudo snap remove bare
    sudo snap remove snapd
else

    sudo snap remove --purge firefox
    sudo snap remove --purge firmware-updater
    sudo snap remove --purge gtk-common-themes
    sudo snap remove --purge snap-store
    sudo snap remove --purge snapd-desktop-integration
    sudo snap remove --purge gnome-42-2204
    sudo snap remove --purge core22
    sudo snap remove --purge bare
    sudo snap remove --purge snapd

fi

remove_snap
sudo apt purge -y snapd

sudo cat <<EOF | sudo tee /etc/apt/preferences.d/nosnap.pref
Package: snapd
Pin: release a=*
Pin-Priority: -10
EOF

rm -rf ~/snap
sudo rm -rf /snap
sudo rm -rf /var/snap
sudo rm -rf /var/lib/snapd

}

# INSTALL & CONFIG PKGS >>>
sudo apt install -y tldr vim git curl
tldr -u


# INSTALL & CONFIG PKGS <<<


# TARS >>>
# setup tar install directory
mkdir -p ~/Apps/bin
# TARS <<<

# MISC

# gnome
gsettings set org.gnome.shell.window-switcher app-icon-mode 'app-icon-only'

# kde
qdbus org.kde.plasmashell /PlasmaShell evaluateScript 'lockCorona(!locked)'



