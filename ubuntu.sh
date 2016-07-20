#!/usr/bin/env bash

# Set up ...

alias install="sudo apt-get install -y"

sudo apt-get update

sudo apt-get upgrade

install curl software-properties-common




# Server Part...

## Install zsh
install zsh
sudo chsh -s $(which zsh) $(whoami)
sh -c "$(curl -fL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## Install htop
install htop

## Install git
install git gitk 

## Install vim
install vim

## Install php
sudo add-apt-repository -y ppa:ondrej/php

install php7.0-cli php7.0-dev php-mbstring \
        php-mysql php-pgsql php-sqlite3

curl -fL https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

printf "\nPATH=\"$(composer config -g home 2>/dev/null)/vendor/bin:\$PATH\"\n" | tee -a ~/.profile
source ~/.profile

composer global require laravel/installer

## Install npm
curl -fL https://deb.nodesource.com/setup_6.x | sudo bash -
install nodejs

curl -fL https://raw.githubusercontent.com/glenpike/npm-g_nosudo/master/npm-g-nosudo.sh > /tmp/npm-g-nosudo.sh
bash /tmp/npm-g-nosudo.sh

npm -g install gulp

## Install ruby
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 
curl -fL https://get.rvm.io | bash -s stable --ruby --rails




# Desktop part...

function install_deb() {
    curl -fL $2 > /tmp/$1.deb
    sudo dpkg -i /tmp/$1.deb
    sudo apt-get -f  install
}

## Install tlp
sudo add-apt-repository -y ppa:linrunner/tlp
sudo apt-get update
install tlp

## Install indicators
install indicator-multiload indicator-cpufreq

## Install variety
sudo add-apt-repository -y ppa:peterlevi/ppa
sudo apt-get update
install variety variety-slideshow

## Install dropbox
install_deb dropbox https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb

## Install sublime text
install_deb sublime https://download.sublimetext.com/sublime-text_build-3083_amd64.deb

composer global require friendsofphp/php-cs-fixer
composer global require phpmd/phpmd
composer global require phpcs/phpcs

## Install valentina studio
install_deb vstudio http://www.valentina-db.com/en/studio/download/current/vstudio_x64_lin-deb

## Install virtualbox
install virtualbox

## Install vagrant
curl -fL https://releases.hashicorp.com/vagrant/1.8.5/vagrant_1.8.5_x86_64.deb > /tmp/vagrant.deb
sudo dpkg -i /tmp/vagrant.deb
sudo apt-get -f install

## Install laravel/homestead
git clone https://github.com/laravel/homestead ~/Homestead
cd ~/Homestead
bash init.sh
cd ~

install nfs-kernel-server




# Others

function echo_if_not_exist() {
    file=$1
    line=$2
    grep --quiet --fixed-strings 'include "$line"' "$file" || echo "$line" >> "$file"
}

echo_if_not_exist ~/.zshrc "alias zshconfig='vim ~/.zshrc'"
echo_if_not_exist ~/.zshrc "alias zshsource='source ~/.zshrc'"

echo_if_not_exist ~/.zshrc "alias upgrade='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get auto-remove -y'"
echo_if_not_exist ~/.zshrc "alias install='sudo apt-get install -y'"
echo_if_not_exist ~/.zshrc "alias remove='sudo apt-get remove -y'"
echo_if_not_exist ~/.zshrc "alias purge='sudo apt-get purge -y'"

echo_if_not_exist ~/.zshrc "alias hom='function __homestead() { (cd ~/Homestead && vagrant $*); unset -f __homestead; }; __homestead'"
echo_if_not_exist ~/.zshrc "alias art='php artisan'"

source ~/.zshrc




# Cleanup...

unset -f echo_if_not_exist
unset -f install_deb
