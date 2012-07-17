root = File.expand_path(File.dirname(__FILE__))

file_cache_path File.expand_path(File.join(root, '..', 'chef-cache'))
cookbook_path ["#{root}/community_cookbooks", "#{root}/custom_cookbooks"]
data_bag_path root + '/data_bags'
role_path root + '/roles'
