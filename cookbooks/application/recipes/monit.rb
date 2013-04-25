template "/etc/monit/conf.d/#{node[:application][:name]}.conf" do
  source "unicorn.monit.erb"
end