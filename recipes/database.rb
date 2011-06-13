directory "/var/www/shared/config" do
  owner "www-data"
  group "www-data"
  recursive true
end

case node[:db][:adapter]
when "mysql"
  include_recipe "app::db_mysql"
when "postgresql"
  include_recipe "app::db_postgres"
when "sqlite3"
  include_recipe "app::db_sqlite3"
end
