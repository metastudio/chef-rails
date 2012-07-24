#!/bin/bash

chef_binary=`which chef-solo`

# courtesy of https://github.com/joshfng/railsready
function install_ruby {
  ruby_version="1.9.3"
  ruby_version_string="1.9.3-p194"
  ruby_source_url="http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.gz"
  ruby_source_tar_name="ruby-1.9.3-p194.tar.gz"
  ruby_source_dir_name="ruby-1.9.3-p194"
  ruby_install_temp_path=$(cd && pwd)/ruby-install

  log_file=install.log

  cd && mkdir -p $ruby_install_temp_path/src && cd $ruby_install_temp_path && touch $log_file

  apt-get -y install \
    wget curl build-essential clang \
    bison openssl zlib1g \
    libxslt1.1 libssl-dev libxslt1-dev \
    libxml2 libffi-dev libyaml-dev \
    libxslt-dev autoconf libc6-dev \
    libreadline6-dev zlib1g-dev libcurl4-openssl-dev \
    libtool

  cd $ruby_install_temp_path/src && wget $ruby_source_url
  tar -xzf $ruby_source_tar_name >> $log_file 2>&1
  cd  $ruby_source_dir_name && ./configure --prefix=/usr/local >> $log_file 2>&1 \
   && make >> $log_file 2>&1 \
    && make install >> $log_file 2>&1

  gem update --system --no-ri --no-rdoc
  gem install bundler --no-ri --no-rdoc
}

# Are we on a vanilla system?
if ! test -f "$chef_binary"; then
  export DEBIAN_FRONTEND=noninteractive
  apt-get update &&
  apt-get -y remove ruby rubygems rubygems1.8 &&
    install_ruby && 
    gem install --no-rdoc --no-ri chef --version 0.10.8
  chef_binary=`which chef-solo`
fi

"$chef_binary" -c ~/chef/solo.rb -j ~/chef/config/${CONFIG}.json
