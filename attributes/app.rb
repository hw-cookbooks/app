default[:app][:repository] = "https://github.com/RailsApps/rails3-devise-rspec-cucumber.git"
default[:app][:revision] = "master"
default[:app][:migrate] = true
default[:app][:rails_env] = "production"
default[:app][:use_deploy_key] = false
default[:app][:enable_submodules] = true
default[:app][:migration_command] = "bundle exec rake db:migrate"
