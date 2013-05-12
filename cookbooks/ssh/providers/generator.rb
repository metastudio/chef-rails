action :generate do
  execute "generate ssh key for #{new_resource.username}." do
    user new_resource.username
    creates "/home/#{new_resource.username}/.ssh/id_rsa.pub"
    command "ssh-keygen -t rsa -q -f /home/#{new_resource.username}/.ssh/id_rsa -P \"\""
  end

  new_resource.updated_by_last_action(true)
end
