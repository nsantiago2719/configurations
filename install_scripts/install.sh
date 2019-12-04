#!/bin/bash

#
# Author: Norman Santiago
# This installs rvm with ruby version 2.6.3 and the latest rails.
# Depending on the operating system and distro it will install gnupg, curl
# and git packages.
#
# Note: This script doesn't support Windows as it only runs on Linux/Unix based systems.
#


packages=("gnupg curl git")
function install_rvm (){
  ###Installing RVM, Ruby and Ruby on Rails
  if ! which rvm > /dev/null; then
    ### Add GPG key
    gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    # Installing RVM with ruby version 2.6.3
    curl -L https://get.rvm.io | bash -s stable --ruby=2.6.3
    #Add RVM source to zshrc
    echo "[[ -s '$HOME/.rvm/scripts/rvm' ]] && source '$HOME/.rvm/scripts/rvm'" >> $HOME/.zshrc
    rvm requirements
    # Installing rails
    # make sure to install the latest rails
    gem install rails --no-document
  fi
}

if [ $(uname -s) == "Linux" ]; then
  echo "What distro are you using?";
  echo "Ubuntu: 1, Arch: 2, CentOS/RHEL/Fedora: 3";
  read distro
  if [ "$distro" == "1" ]; then
    sudo apt install ${packages[0]}
  elif [ "$distro" == "2" ]; then
    sudo pacman -S ${packages[0]}
  elif [ "$distro" == "3" ]; then
    sudo yum install ${packages[0]}
  fi
  install_rvm
  exit 0;
fi

if [ $(uname -s) == "Darwin" ]; then
  brew install ${pacakges[0]}
  install_rvm
  exit 0
fi


