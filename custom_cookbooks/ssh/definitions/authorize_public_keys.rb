define :authorize_public_keys, data_bag: nil, username: nil do
  username      = params[:username]
  data_bag_name = params[:data_bag]
  
  raise ":username should be provided." if username.nil?
  raise ":data_bag should be provided." if data_bag_name.nil?

  bags    = data_bag data_bag_name
  pubkeys = bags.map {|bag| data_bag_item(data_bag_name, bag)['key']}

  template "/home/#{username}/.ssh/authorized_keys" do
    cookbook "ssh"
    source "authorized_keys.erb"
    owner username
    group username
    mode 0600
    variables keys: pubkeys
  end
end