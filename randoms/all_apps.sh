# SCRIPT TO INSTALL THE FOLLOWING APPS
# nala
# firefox
# gnome extension
# gnome tweaks
# vlc
# dash-to-dock
# firewall
# flatpak``
# ms edge
# chrome
# obs studio
# node js


#! usr/bin/bash

echo -e "Process starting\n"
sudo apt update

# Nala to replace apt
echo -e "\n\nNala Process\n"
curl https://gitlab.com/volian/volian-archive/-/raw/main/install-nala.sh | bash
sudo apt install -t nala nala
sudo nala fetch
sudo nala update
sudo nala upgrade


# Reinstall Firefox
# Site to article: https://www.omgubuntu.co.uk/2022/04/how-to-install-firefox-deb-apt-ubuntu-22-04
echo -e "\n\nFirefox process\n"
sudo snap remove firefox
sudo install -d -m 0755 /etc/apt/keyrings
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla
sudo apt update && sudo nala install firefox


# GNOME Extension
echo -e "\n\nGnome Extension Process\n"
sudo nala install gnome-shell-extension-manager


# GNOME Tweaks
echo -e "\n\nGnome Tweaks Process\n"
sudo nala install gnome-tweaks -y


# VLC
echo -e "\n\nVLC Process\n"
sudo nala install ubuntu-restricted-extras
sudo nala install vlc


# Minimize app when it is clicked on the dock
echo -e "\n\nDock Process\n"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'


# Enable firewall
echo -e "\n\nFirewall Process\n"
sudo systemctl enable ufw


# Install Flatpak to replace Snap store
echo -e "\n\nFlatpak Process\n"
sudo nala install flatpak
sudo nala install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo


# VS Code


# MS Edge
echo -e "\n\nMS Edge process\n"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
sudo rm microsoft.gpg
sudo nala install microsoft-edge-stable


# Google Chrome
echo -e "\n\nGoogle chrome process\n"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo nala -f install


# OBS Studio
echo -e "\n\nOBS studio process\n"
sudo add-apt-repository ppa:obsproject/obs-studio
sudo nala install obs-studio


# Flutter IDE
echo -e "\n\nFlutter process\n"


# NodeJS
echo -e "\n\nnode js process\n"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install 20
node -v # should print `v20.13.1`
npm -v # should print `10.5.2`


sudo nala update
echo -e "\n\nProcess done"
