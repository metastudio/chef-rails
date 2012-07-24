default[:nginx][:version]         = "1.2.2"
default[:nginx][:source][:prefix] = "/usr/local/nginx"
default[:nginx][:dir]             = "/usr/local/nginx/etc"
default[:nginx][:log_dir]         = "/usr/local/nginx/log"
default[:nginx][:binary]          = "/usr/local/nginx/sbin/nginx"

default[:nginx][:user]            = "www-data"
default[:nginx][:init_style]      = "upstart"
