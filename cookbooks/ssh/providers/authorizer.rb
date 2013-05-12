action :authorize do
  template "/home/#{new_resource.username}/.ssh/authorized_keys" do
    cookbook "ssh"
    source "authorized_keys.erb"
    owner new_resource.username
    group new_resource.username
    mode 0600
    variables keys: new_resource.keys
  end

  new_resource.updated_by_last_action(true)
end
