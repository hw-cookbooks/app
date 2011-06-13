include_recipe "bluepill"

if node[:unicorn][:bundled]
  # Bundling unicorn with the app is the preferred method.
  red_unicorn = "bundle exec red_unicorn"
else
  # Otherwise attempt to find gems bin path. This smells bad to me.
  require "yaml"
  path = ""
  env = YAML::load(`gem environment`)["RubyGems Environment"]
  env.each do |e|
    path = e["EXECUTABLE DIRECTORY"] if e.key?("EXECUTABLE DIRECTORY")
  end
  red_unicorn = "red_unicorn --unicorn-exec #{path}/unicorn"
end

template "/etc/bluepill/app.pill" do
  source "bluepill.erb"
  variables( :red_unicorn => red_unicorn,
             :environment => node[:app][:rails_env],
             :start_grace_time => node[:bluepill][:start_grace_time],
             :stop_grace_time => node[:bluepill][:stop_grace_time],
             :restart_grace_time => node[:bluepill][:restart_grace_time],
             :mem_usage_mb => node[:bluepill][:mem_usage_mb],
             :cpu_usage_percent => node[:bluepill][:cpu_usage_percent] )
  notifies :load, "bluepill_service[app]"
end

bluepill_service "app" do
  action [ :enable, :load, :start ]
end
