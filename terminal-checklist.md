#### Exterminate SNAP
```sh
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

snap list
# should be empty

sudo apt purge snapd

# pin firefox
sudo cat <<EOF | sudo tee /etc/apt/preferences.d/nosnap.pref
Package: snapd
Pin: release a=*
Pin-Priority: -10
EOF

# cleanup
rm -rf ~/snap
sudo rm -rf /snap
sudo rm -rf /var/snap
sudo rm -rf /var/lib/snapd

```

#### TLDR
```sh
sudo apt install tldr && tldr -u
```

#### ZSH
```sh
sudo apt install zsh && \
chsh -s $(which zsh) && \
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh && \
sh install.sh

# update plugins
cp ~/.zshrc ~/.zshrc.bak
sed -i 's/(git/(git zsh-autosuggestions command-not-found/' ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# check & confirm
diff ~/.zshrc ~/.zshrc.bak

# change theme
sed -i 's/ZSH_THEME=.*$/ZSH_THEME="steeef"/' ~/.zshrc
# check & confirm
diff ~/.zshrc ~/.zshrc.bak

# load custom dot file
##   . ~/.rc
echo '. ~/.rc' >> ~/.zshrc

```
#### ~/.rc file
```sh
PATH="$HOME/.local/bin:$PATH"
```

#### install stuff
```sh
vscode
google-chrome
docker
obsidian
syncthing
ssh
rclone
kde config backup-restore
```
