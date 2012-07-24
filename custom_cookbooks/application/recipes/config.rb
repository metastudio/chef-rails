directory node[:application][:config_path] do
  owner node[:application][:user][:name]
  group node[:application][:user][:name]
end

template "#{node[:application][:config_path]}/database.yml" do
  source "config/database.yml.erb"
  owner node[:application][:user][:name]
  group node[:application][:user][:name]
end

template "#{node[:application][:config_path]}/unicorn.rb" do
  source "config/unicorn.rb.erb"
  owner node[:application][:user][:name]
  group node[:application][:user][:name]
end
