include_recipe "nginx::source"

conf_name = "#{node[:application][:name]}.conf"

template "#{node[:nginx][:dir]}/sites-enabled/#{conf_name}" do
  source "nginx.site.conf.erb"
end

nginx_site conf_name