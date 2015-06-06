#!/bin/sh

function install_thrnio() {
  if sudo sh -c 'hash puppet' 2> /dev/null; then
      echo -n "Where should I put the dotfiles repo?
[default $HOME/dotfiles] "
      read loc
      if [ -z $loc ]; then
          loc=$HOME/dotfiles
      fi
      sudo puppet apply -e "package { 'git': ensure => present }"
      git clone https://github.com/thrnio/dotfiles.git $loc
      sudo puppet module install puppetlabs/apt
      sudo puppet module install puppetlabs/vcsrepo
      sudo puppet module install puppetlabs/inifile
      if [ $(puppet --version | head -c1) -eq 3 ]; then
          parser='--parser future'
      fi
      sudo puppet apply $parser \
           --modulepath=$loc:$(sudo puppet config print modulepath) \
           $loc/install.pp
  else
    echo 'Puppet not installed, aborting!'
    exit 1
  fi
}

install_thrnio()
