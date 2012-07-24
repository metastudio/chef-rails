include_recipe "nginx::source"

template "#{node[:nginx][:dir]}/sites-enabled/#{node[:application][:name]}.conf" do
  source "nginx.site.conf.erb"
end