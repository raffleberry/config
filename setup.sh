# BYE BYE SNAP >>>
sudo snap remove --purge firefox
sudo snap remove --purge gnome-3-38-2004
sudo snap remove --purge gnome-42-2204
sudo snap remove --purge gtk-common-themes
sudo snap remove --purge snapd-desktop-integration
sudo snap remove --purge snap-store
sudo snap remove --purge core20
sudo snap remove --purge core22
sudo snap remove --purge bare
sudo snap remove --purge snapd

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

# BYE BYE SNAP <<<

# INSTALL & CONFIG PKGS >>>
sudo apt install -y tldr zsh vim

tldr -u

# INSTALL & CONFIG PKGS <<<

# CONFIG ZSH >>>
cp ~/.zshrc ~/.zshrc.bak
sed -i 's/(git/(git zsh-autosuggestions command-not-found/' ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

diff ~/.zshrc ~/.zshrc.bak

# change theme
sed -i 's/ZSH_THEME=.*$/ZSH_THEME="steeef"/' ~/.zshrc
# check & confirm
diff ~/.zshrc ~/.zshrc.bak

# load custom dot file
##   . ~/.rc
echo '. ~/.rc' >> ~/.zshrc


touch ~/.rc
# CONFIG ZSH <<<


# INSTALL DEBS >>>

wget -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./chrome.deb

wget -O code.deb https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
sudo apt install -y ./code.deb

# INSTALL DEBS <<<

# install oh-my-zsh
chsh -s $(which zsh) && \
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh && \
sh install.sh

# TARS >>>
# setup tar install directory
mkdir -p ~/Apps
mkdir -p ~/Apps/bin


# nodejs
wget https://nodejs.org/dist/v20.12.2/node-v20.12.2-linux-x64.tar.xz
tar -xvf node-v20.12.2-linux-x64.tar.xz -C ~/Apps/ && rm node-v20.12.2-linux-x64.tar.xz

ln -s ~/Apps/node-v20.12.2-linux-x64 ~/Apps/node

echo '\nPATH=$PATH:~/Apps/node/bin/' >>  ~/.rc

# go
wget https://go.dev/dl/go1.22.2.linux-amd64.tar.gz
tar -xvf go1.22.2.linux-amd64.tar.gz -C ~/Apps/ && rm go1.22.2.linux-amd64.tar.gz

mv ~/Apps/go ~/Apps/go1.22.2.linux-amd64

ln -s ~/Apps/go1.22.2.linux-amd64 ~/Apps/go

echo '\nPATH=$PATH:~/Apps/go/bin/' >>  ~/.rc


# TARS <<<
