#!/bin/bash


cd ~
cat ~/.ssh/hassio.pub | cat >> ~/.ssh/authorized_keys

chmod 700 .ssh
chmod 600 .ssh/authorized_keys

sudo apt-get install mc 
sudo apt-get install htop
sudo apt-get install bmon
sudo apt-get install nmon

sudo usermod -aG homeassistant $USER

sudo chmod -R g+rwX /home/homeassistant

yes | cp -rf ~/cfg/* /home/homeassistant/.homeassistant/

sudo chown -R homeassistant:homeassistant /srv/homeassistant

sudo apt-get install vlc
sudo usermod -a -G audio homeassistant

sudo systemctl restart home-assistant@homeassistant

#install hassctl
sudo curl -o /usr/local/bin/hassctl https://raw.githubusercontent.com/dale3h/hassctl/master/hassctl && sudo chmod +x /usr/local/bin/hassctl