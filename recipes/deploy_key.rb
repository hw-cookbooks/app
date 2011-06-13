directory "/var/www/.ssh" do
  owner "www-data"
  group "www-data"
  recursive true
end

cookbook_file "/var/www/.ssh/id_rsa" do
  source "deploy_key_id_rsa"
  owner "www-data"
  group "www-data"
  mode "600"
end

cookbook_file "/var/www/.ssh/known_hosts" do
  owner "www-data"
  group "www-data"
  mode "644"
end
