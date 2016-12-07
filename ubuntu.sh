#!/usr/bin/env bash

# Set up...
sudo apt-get install -y git vim curl software-properties-common


## Install zsh
sudo apt-get install -y zsh
sudo chsh -s $(which zsh) $(whoami)
sh -c "$(curl -fL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## Install htop
sudo apt-get install -y htop

## Install gitk
sudo apt-get install -y gitk

## Install php
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y php7.0-cli php7.0-dev php-mbstring
sudo apt-get install -y php-mysql php-pgsql php-sqlite3
sudo apt-get install -y php7.0-mcrypt php-gd

## Install composer
curl -fL https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

## Install npm
curl -fL https://deb.nodesource.com/setup_6.x > /tmp/node.sh
sudo bash /tmp/node.sh
sudo apt-get install -y nodejs

curl -fL https://raw.githubusercontent.com/glenpike/npm-g_nosudo/master/npm-g-nosudo.sh > /tmp/npm-g-nosudo.sh
bash /tmp/npm-g-nosudo.sh

## Install ruby
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -fL https://get.rvm.io | bash -s stable --ruby
source ~/.rvm/scripts/rvm

## Install JRE and JDK
sudo apt-get install -y default-jre default-jdk

## Install nmap
sudo apt-get install -y nmap

## Install nfs
sudo apt-get install -y nfs-common nfs-kernel-server


# Desktop part...

## Install TLP
sudo add-apt-repository -y ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install -y tlp

## Install indicators
sudo apt-get install -y indicator-multiload indicator-cpufreq
sudo add-apt-repository -y ppa:vlijm/spaceview
sudo apt update
sudo apt install -y spaceview

## Install Variety
sudo add-apt-repository -y ppa:peterlevi/ppa
sudo apt-get update
sudo apt-get install -y variety variety-slideshow

## Install Sublime Text
curl -fL https://download.sublimetext.com/sublime-text_build-3083_amd64.deb > /tmp/sublime.deb
sudo dpkg -i /tmp/sublime.deb
sudo apt-get -yf install

## Install Valentina Studio
curl -fL http://www.valentina-db.com/en/studio/download/current/vstudio_x64_lin-deb > /tmp/vstudio.deb
sudo dpkg -i /tmp/vstudio.deb
sudo apt-get -yf install

## Install Virtualbox
sudo apt-get install -y virtualbox

## Install Vagrant
curl -fL https://releases.hashicorp.com/vagrant/1.9.0/vagrant_1.9.0_x86_64.deb > /tmp/vagrant.deb
sudo dpkg -i /tmp/vagrant.deb
sudo apt-get -yf install

## Install Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install -y spotify-client

## Install Unity Tweak Tool
sudo apt-get install -y unity-tweak-tool

## Install Gparted
sudo apt-get install -y gparted


# Finishing up...
sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo apt-get -y autoclean
