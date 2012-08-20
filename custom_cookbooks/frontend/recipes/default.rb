include_recipe "nginx::source"

conf_name = "#{node[:application][:name]}.conf"

template "#{node[:nginx][:dir]}/sites-enabled/#{conf_name}" do
  source "nginx.site.conf.erb"
end

nginx_site conf_name

if node[:application][:http_auth]
  package "apache2-utils"
  
  htpasswd "#{node[:nginx][:dir]}/htpasswd" do
    user      node[:application][:http_auth][:user]
    password  node[:application][:http_auth][:password]
  end
end