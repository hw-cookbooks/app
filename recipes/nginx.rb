include_recipe "nginx"

template "/etc/nginx/sites-available/app" do
  source "nginx.erb"
  notifies :restart, "service[nginx]"
end

nginx_site "default" do
  enable false
end

nginx_site "app" do
  enable true
end
