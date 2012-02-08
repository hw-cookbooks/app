mongodb_server = Discovery.search( "mongodb_server", :node => node )
host = Discovery.ipaddress( :remote_node => mongodb_server, :node => node)

template "/var/www/shared/config/mongoid.yml" do
  variables( :host => host )
end
