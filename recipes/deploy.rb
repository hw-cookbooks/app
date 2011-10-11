include_recipe "app"

if node[:app][:use_deploy_key]
  include_recipe "app::deploy_key"
end

gem_package "bundler"

%w( shared
    shared/pids
    shared/system
    shared/log ).each do |d|
  directory "/var/www/#{d}" do
    owner "www-data"
    group "www-data"
    recursive true
  end
end

deploy_revision "/var/www" do
  repository node[:app][:repository]
  revision node[:app][:revision]
  user "www-data"
  enable_submodules node[:app][:enable_submodules]
  migrate node[:app][:migrate]
  migration_command node[:app][:migration_command]
  environment "RAILS_ENV" => node[:app][:rails_env]
  shallow_clone true

  before_migrate do
    execute "bundle gems" do
      command "bundle install " +
        "--deployment --without development test " +
        "--path /var/www/shared/bundle " +
        "--binstubs /var/www/shared/bundle/bin"
      user "www-data"
      group "www-data"
      cwd release_path
    end
  end

  restart do
    execute "restart unicorn" do
      command "bluepill app restart"
      user "root"
    end
  end

  action node[:app][:deploy_action]
end
