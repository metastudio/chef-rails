# Install Percona

include_recipe 'percona::package_repo'
include_recipe 'percona::client'
include_recipe 'percona::server'
include_recipe 'percona::backup'

chef_gem 'mysql'

mysql_connection_info = { :host     => node[:database][:host],
                          :username => 'root',
                          :password => node[:percona][:server][:root_password] }

mysql_database node[:database][:name] do
  connection mysql_connection_info

  action :create
end

mysql_database_user node[:database][:user] do
  connection mysql_connection_info
  password node[:database][:password]
  database_name node[:database][:name]
  privileges [:all]

  action :grant
end

# xtrabackup

backup_dir = "#{node[:backup][:directory]}/database"

directory backup_dir do
  recursive true
end

cron "backup database" do
  hour "6"
  minute "0"
  weekday "5"
  mailto node[:email][:support]
  command "/bin/bash -c 'xtrabackup --backup --target-dir=#{backup_dir}'"

  action :create
end
