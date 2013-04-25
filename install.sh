#!/bin/bash

chef_binary=`which chef-solo`

# Are we on a vanilla system?
if ! test -f "$chef_binary"; then
  export DEBIAN_FRONTEND=noninteractive
  apt-get update &&
    apt-get -y install ruby1.9.1-dev &&
    gem install --no-rdoc --no-ri chef --version '~> 11.4.0'
  chef_binary=`which chef-solo`
fi

"$chef_binary" -c ~/chef/solo.rb -j ~/chef/config/${CONFIG}.json
