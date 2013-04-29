define :authorize_public_keys, keys: [], username: nil do
  username = params[:username]
  
  raise ":username should be provided." if username.nil?

  template "/home/#{username}/.ssh/authorized_keys" do
    cookbook "ssh"
    source "authorized_keys.erb"
    owner username
    group username
    mode 0600
    variables keys: params[:keys]
  end
end
