set[:nginx][:version]         = "1.2.2"
set[:nginx][:source][:prefix] = "/usr/local/nginx"
set[:nginx][:dir]             = "/usr/local/nginx/conf"
set[:nginx][:log_dir]         = "/usr/local/nginx/log"
set[:nginx][:binary]          = "/usr/local/nginx/sbin/nginx"

set[:nginx][:user]            = "www-data"
set[:nginx][:init_style]      = "upstart"
