package "libpq-dev"

template "/var/www/shared/config/database.yml" do
  source "database.yml.erb"
  owner "www-data"
  group "www-data"
  variables( :adapter => node[:db][:adapter],
             :name => node[:db][:name],
             :user => node[:db][:user],
             :pass => node[:db][:pass],
             :host => node[:db][:host] )
end

execute "create #{node[:db][:user]} database user" do
  command "createuser --createdb --no-createrole --no-superuser #{node[:db][:user]} && \
    psql --command \"alter role #{node[:db][:user]} with encrypted password '#{node[:db][:pass]}'\""
  user "postgres"
  not_if do
    `sudo -u postgres psql --tuples-only --command=" \
      select rolname from pg_roles where \
      rolname = '#{node[:db][:user]}'"`.strip == "#{node[:db][:user]}"
  end
end

execute "create #{node[:db][:name]} database" do
  command "createdb --encoding=UTF8 --owner=#{node[:db][:user]} #{node[:db][:name]}"
  user "postgres"
  not_if do
    `sudo -u postgres psql --tuples-only --command=" \
      select datname from pg_database where \
      datname = '#{node[:db][:name]}'"`.strip == "#{node[:db][:name]}"
  end
end
