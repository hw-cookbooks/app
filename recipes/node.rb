package "python-software-properties"

execute "apt-get update" do
  action :nothing
end

execute "add-apt-repository ppa:jerome-etienne/neoip" do
  not_if "apt-key list | grep 2D83C357"
  notifies :run, "execute[apt-get update]", :immediately 
end

package "nodejs"
