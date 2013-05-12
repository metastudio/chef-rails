include_recipe "application::software"
include_recipe "application::capistrano"
include_recipe "application::config"

# We need to generate SSH key for application account in order to add
# it to the SCM
ssh_generator node[:application][:user][:name]

# We need to add keys to authorized_keys in order to be able
# to deploy without password

all_keys = search(:authorized_keys, '*:*').to_a
all_keys.select! { |key| node[:authorization][:ssh].include?(key['id']) } if node[:authorization][:ssh]
ssh_authorizer node[:application][:user][:name] do
  keys all_keys.map{|data_bag_item| data_bag_item['key']}
end

# monit

include_recipe "application::monit"

# init

template "/etc/init.d/#{node[:application][:name]}" do
  source "init.erb"
  mode 0755
end  

# ability to start app

commands =  [ "/usr/bin/monit start #{node[:application][:name]}" ]
commands += node[:authorization][:sudo][:commands]

sudo node[:application][:name] do
  user     node[:application][:user][:name]
  commands commands
  nopasswd true
end

template "/etc/logrotate.d/#{node[:application][:name]}" do
  source "logrotate.conf.erb"
  mode 0644
end
