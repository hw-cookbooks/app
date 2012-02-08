include_recipe "percona::client"

mysql_server = Discovery.search( "database-master", :node => node )
host = Discovery.ipaddress( :remote_node => mysql_server, :node => node)

template "/var/www/shared/config/database.yml" do
  source "database.yml.erb"
  owner "www-data"
  group "www-data"
  variables( :adapter => node[:db][:adapter],
             :name => mysql_server[:db][:name],
             :user => mysql_server[:db][:username],
             :pass => mysql_server[:db][:password],
             :host => host )
end
