include_recipe "bluepill"

template "/etc/bluepill/app.pill" do
  source "bluepill.erb"
  variables( :environment => node[:app][:rails_env],
             :start_grace_time => node[:bluepill][:start_grace_time],
             :stop_grace_time => node[:bluepill][:stop_grace_time],
             :restart_grace_time => node[:bluepill][:restart_grace_time],
             :mem_usage_mb => node[:bluepill][:mem_usage_mb],
             :cpu_usage_percent => node[:bluepill][:cpu_usage_percent] )
end

bluepill_service "app" do
  action [ :enable, :load, :start ]
end
