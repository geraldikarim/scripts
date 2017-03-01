#!/usr/bin/env bash

# Set up...


## Install Some Basic Packages
sudo apt-get install -y curl software-properties-common
sudo apt-get install -y build-essential dos2unix gcc git libmcrypt4 libpcre3-dev ntp unzip \
make python2.7-dev python-pip re2c supervisor unattended-upgrades whois vim libnotify-bin
echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale
locale-gen en_US.UTF-8

## Install zsh
sudo apt-get install -y zsh
sudo chsh -s $(which zsh) $(whoami)
sh -c "$(curl -sSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## Install htop
sudo apt-get install -y htop

## Install gitk
sudo apt-get install -y gitk

## Install php
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y --force-yes php7.1-cli php7.1-dev \
php7.1-pgsql php7.1-sqlite3 php7.1-gd \
php7.1-curl php7.1-memcached \
php7.1-imap php7.1-mysql php7.1-mbstring \
php7.1-xml php7.1-zip php7.1-bcmath php7.1-soap \
php7.1-intl php7.1-readline php-xdebug

## Install composer
curl -sSL https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
printf "\nPATH=\"$(sudo su - geraldi -c 'composer config -g home 2>/dev/null')/vendor/bin:\$PATH\"\n" | tee -a /home/geraldi/.profile
sudo su geraldi <<'EOF'
/usr/local/bin/composer global require "laravel/installer"
EOF

## Install npm
curl -sSL https://deb.nodesource.com/setup_6.x | sudo bash -
sudo apt-get install -y nodejs
/usr/bin/npm install -g gulp
/usr/bin/npm install -g bower
/usr/bin/npm install -g yarn
/usr/bin/npm install -g grunt-cli

curl --silent --location https://raw.githubusercontent.com/glenpike/npm-g_nosudo/master/npm-g-nosudo.sh | bash -

## Install sqlite
apt-get install -y sqlite3 libsqlite3-dev

## Install ruby
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby
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
curl -sSL https://download.sublimetext.com/sublime-text_build-3126_amd64.deb > /tmp/sublime.deb
sudo dpkg -i /tmp/sublime.deb
sudo apt-get -yf install

## Install Valentina Studio
curl -sSL http://www.valentina-db.com/en/studio/download/current/vstudio_x64_lin-deb > /tmp/vstudio.deb
sudo dpkg -i /tmp/vstudio.deb
sudo apt-get -yf install

## Install Virtualbox
sudo apt-get install -y virtualbox

## Install Vagrant
curl -sSL https://releases.hashicorp.com/vagrant/1.9.2/vagrant_1.9.2_x86_64.deb > /tmp/vagrant.deb
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
