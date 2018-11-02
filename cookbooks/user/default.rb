# ssh設定関連
directory "/home/#{node[:server][:base][:username]}/.ssh" do
  action :create
  user  "root"
  owner node[:server][:base][:username]
  group node[:server][:base][:username]
  mode  "700"
end

directory "/home/#{node[:server][:base][:username]}/.ssh/conf.d" do
  action :create
  user "root"
  owner
end

# ssh-config
remote_file "/home/#{node[:server][:base][:username]}/.ssh/config" do
  action :create
  user  "root"
  owner node[:server][:base][:username]
  group node[:server][:base][:username]
  mode  "600"
  source "./files/.ssh/config"
end

# bash設定
remote_file "/home/#{node[:server][:base][:username]}/.bash_profile" do
  action :create
  owner node[:server][:base][:username]
  group node[:server][:base][:username]
  mode  "644"
  source "./files/.bash_profile"
end

remote_file "/home/#{node[:server][:base][:username]}/.bashrc" do
  action :create
  owner node[:server][:base][:username]
  group node[:server][:base][:username]
  mode  "644"
  source "./files/.bashrc"
end

remote_file "/home/#{node[:server][:base][:username]}/.inputrc" do
  action :create
  owner node[:server][:base][:username]
  group node[:server][:base][:username]
  mode  "644"
  source "./files/.inputrc"
end

# vim設定
remote_file "/home/#{node[:server][:base][:username]}/.vimrc" do
  action :create
  owner node[:server][:base][:username]
  group node[:server][:base][:username]
  mode  "644"
  source "./files/.vimrc"
end

# git設定
remote_file "/home/#{node[:server][:base][:username]}/.gitconfig" do
  action :create
  owner node[:server][:base][:username]
  group node[:server][:base][:username]
  mode  "644"
  source "./files/.gitconfig"
end
