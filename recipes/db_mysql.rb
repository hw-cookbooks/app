include_recipe "mysql::client"

mysql_database "create app database" do
  host node[:db][:host]
  username "root"
  password node[:mysql][:server_root_password]
  database node[:db][:name]
  action :create_db
end

template "/var/www/shared/config/database.yml" do
  source "database.yml.erb"
  owner "www-data"
  group "www-data"
  variables( :adapter => node[:db][:adapter],
             :name => node[:db][:name],
             :user => "root",
             :pass => node[:mysql][:server_root_password],
             :host => node[:db][:host] )
end
