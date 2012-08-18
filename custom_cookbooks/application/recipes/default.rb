include_recipe "application::software"
include_recipe "application::capistrano"
include_recipe "application::config"

# We need to generate SSH key for application account in order to add
# it to the SCM
generate_ssh_keys do 
  user_account node[:application][:user][:name]
end

# We need to add keys to authorized_keys in order to be able
# to deploy without password
authorize_public_keys do
  data_bag "authorized_keys"
  username node[:application][:user][:name]
end