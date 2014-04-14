#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

umask 022

set -e
set -x

# update system
apt-get update -yq

# install basic packages
apt-get install --no-install-suggests -yq \
  build-essential \
  make \
  curl \
  screen

# update ruby
curl -sSL https://get.rvm.io | bash -s stable
source /usr/local/rvm/scripts/rvm
rvm use ruby-1.9.3-p545 --install --default

# update chef
gem install chef --version 11.12.2 --no-rdoc --no-ri --conservative
