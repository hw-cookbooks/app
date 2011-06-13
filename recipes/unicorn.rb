gem_package "red_unicorn" unless node[:unicorn][:bundled]

directory "/etc/unicorn"

directory "/var/run/unicorn" do
  owner "www-data"
  group "www-data"
end

template "/etc/unicorn/app.rb" do
  source "unicorn.erb"
  owner "root"
  group "root"
  mode "644"
  variables( :timeout => node[:unicorn][:timeout],
             :cow_friendly => node[:unicorn][:cow_friendly],
             :worker_processes => node[:cpu][:total] )
  notifies :restart, "bluepill_service[app]"
end
