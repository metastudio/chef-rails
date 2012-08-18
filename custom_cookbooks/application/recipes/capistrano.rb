# Create deployment user

user node[:application][:user][:name] do
  comment "#{node[:application][:name]} app user"
  shell "/bin/bash"
  home node[:application][:user][:home]
  supports manage_home: true
end

# Prepare dirs for capistrano deployments
# That's the same as if you run cap deploy:setup

dirs_to_create = [node[:application][:path],
  node[:application][:shared_path], 
  "#{node[:application][:shared_path]}/system",
  "#{node[:application][:shared_path]}/log",
  "#{node[:application][:shared_path]}/pids",
  node[:application][:releases_path]]

dirs_to_create.each do |directory_name|
  directory directory_name do
    mode 0755
    owner node[:application][:user][:name]
    group node[:application][:user][:name]
    recursive true
  end
end
