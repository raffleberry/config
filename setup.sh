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

sudo apt install -y ttf-mscorefonts-installer


# INSTALL & CONFIG PKGS <<<

# CONFIG ZSH >>>

# install oh-my-zsh
chsh -s $(which zsh) && \
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh && \
sh install.sh


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

# - docker
wget -O containerd.io.deb https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/containerd.io_1.6.31-1_amd64.deb
wget -O docker-ce-cli.deb https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce-cli_26.1.1-1~ubuntu.22.04~jammy_amd64.deb
wget -O docker-ce.deb https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce_26.1.1-1~ubuntu.22.04~jammy_amd64.deb
wget -O docker-buildx-plugin.deb https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-buildx-plugin_0.14.0-1~ubuntu.22.04~jammy_amd64.deb
wget -O docker-compose-plugin.deb https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-compose-plugin_2.27.0-1~ubuntu.22.04~jammy_amd64.deb

sudo apt install ./containerd.io.deb
sudo apt install ./docker-ce-cli.deb
sudo apt install ./docker-ce.deb
sudo apt install ./docker-buildx-plugin.deb
sudo apt install ./docker-compose-plugin.deb

sudo usermod -aG docker $USER

# INSTALL DEBS <<<

# TARS >>>
# setup tar install directory
mkdir -p ~/Apps
mkdir -p ~/Apps/bin


# nodejs
wget https://nodejs.org/dist/v20.12.2/node-v20.12.2-linux-x64.tar.xz
tar -xvf node-v20.12.2-linux-x64.tar.xz -C ~/Apps/ && rm node-v20.12.2-linux-x64.tar.xz

ln -s ~/Apps/node-v20.12.2-linux-x64 ~/Apps/node

echo '\nPATH=$PATH:~/Apps/node/bin/'

npm i -g bash-language-server

# go
wget https://go.dev/dl/go1.22.2.linux-amd64.tar.gz
tar -xvf go1.22.2.linux-amd64.tar.gz -C ~/Apps/ && rm go1.22.2.linux-amd64.tar.gz

mv ~/Apps/go ~/Apps/go1.22.2.linux-amd64

ln -s ~/Apps/go1.22.2.linux-amd64 ~/Apps/go

echo '\nPATH=$PATH:~/Apps/go/bin/'
echo '\nPATH=$PATH:~/go/bin'

go install golang.org/x/tools/gopls@latest

# TARS <<<


# MISC

# gnome
gsettings set org.gnome.shell.window-switcher app-icon-mode 'app-icon-only'

# kde

qdbus org.kde.plasmashell /PlasmaShell evaluateScript 'lockCorona(!locked)'



