default[:application][:current_path]  = "#{node[:application][:path]}/current"
default[:application][:shared_path]   = "#{node[:application][:path]}/shared"
default[:application][:config_path]   = "#{node[:application][:shared_path]}/config"
default[:application][:releases_path] = "#{node[:application][:path]}/releases"

default[:application][:user][:home]   = "/home/#{node[:application][:user][:name]}"

default[:application][:workers]       = 2
default[:application][:socket]        = "/tmp/#{node[:application][:name]}.socket"
