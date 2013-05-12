actions :authorize

attribute :username, :kind_of => String, :name_attribute => true
attribute :keys, :kind_of => Array, :required => true

default_action :authorize