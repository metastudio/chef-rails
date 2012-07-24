default[:application][:shared_path]   = "#{node[:application][:path]}/shared"
default[:application][:config_path]   = "#{node[:application][:shared_path]}/config"
default[:application][:releases_path] = "#{node[:application][:path]}/releases"

default[:application][:user][:home]   = "/home/#{node[:application][:user][:name]}"

default[:database][:name]             = "#{node[:application][:name]}_#{node[:application][:environment]}"
default[:database][:user]             = node[:application][:user][:name]
