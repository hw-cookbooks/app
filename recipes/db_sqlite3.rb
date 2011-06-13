package "libsqlite3-dev"

template "/var/www/shared/config/database.yml" do
  source "database.sqlite3.yml.erb"
  owner "www-data"
  group "www-data"
end
