default[:database][:host] = "localhost"
default[:database][:name] = "#{node[:application][:name]}_#{node[:application][:environment]}"
default[:database][:user] = node[:application][:user][:name]
