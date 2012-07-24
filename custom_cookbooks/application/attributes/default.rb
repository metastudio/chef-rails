default[:application][:shared_path]   = "#{node[:application][:path]}/shared"
default[:application][:releases_path] = "#{node[:application][:path]}/releases"

default[:application][:user][:home]   = "/home/#{node[:application][:user][:name]}"