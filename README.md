# chef-solo cookbooks for Ruby on Rails app

Set of roles and recipes for bootstrapping typical Ruby on Rails website. It uses nginx, unicorn and 
MySQL. Has been tested with Ubuntu 12.04.

## Requirements

1. You should be able to login as `root` to the target system.
2. Ruby 1.9.3

## Usage

```bash
HOST=192.168.2.103 CONFIG=application ./deploy.sh
```

It will install ```ruby``` and ```chef```, copy ```chef``` files to the target hostname, and run the JSON configuration with specified name.