#!/usr/bin/env bash

# Set up ...

sudo apt-get update

sudo apt-get upgrade -y

sudo apt-get install -y git vim curl software-properties-common




# Server Part...

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
sudo apt-get install -y php7.0-cli php7.0-dev php-mbstring \
                        php-mysql php-pgsql php-sqlite3 \
                        php7.0-mcrypt php-gd

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




# Desktop part...

## Install tlp
sudo add-apt-repository -y ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install -y tlp

## Install indicators
sudo apt-get install -y indicator-multiload indicator-cpufreq

## Install variety
sudo add-apt-repository -y ppa:peterlevi/ppa
sudo apt-get update
sudo apt-get install -y variety variety-slideshow

## Install dropbox
curl -fL https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb > /tmp/dropbox.deb
sudo dpkg -i /tmp/dropbox.deb
sudo apt-get -yf install

## Install sublime text
curl -fL https://download.sublimetext.com/sublime-text_build-3083_amd64.deb > /tmp/sublime.deb
sudo dpkg -i /tmp/sublime.deb
sudo apt-get -yf install

## Install valentina studio
curl -fL http://www.valentina-db.com/en/studio/download/current/vstudio_x64_lin-deb > /tmp/vstudio.deb
sudo dpkg -i /tmp/vstudio.deb
sudo apt-get -yf install

## Install virtualbox
sudo apt-get install -y virtualbox

## Install vagrant
curl -fL https://releases.hashicorp.com/vagrant/1.8.5/vagrant_1.8.5_x86_64.deb > /tmp/vagrant.deb
sudo dpkg -i /tmp/vagrant.deb
sudo apt-get -yf install
