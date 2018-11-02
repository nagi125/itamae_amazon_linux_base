# baseリポジトリの追加
remote_file "/etc/yum.repos.d/centos6-base.repo" do
  action :create
  owner "root"
  group "root"
  mode  "644"
  source "./files/etc/yum.repos.d/centos6-base.repo"
end

# yumのupdate
execute "yum -y groupinstall 'Japanese Support' --enablerepo=base" do
  user "root"
  command "yum -y groupinstall 'Japanese Support' --enablerepo=base"
end

# リポジトリ追加(epel)
execute "yum install -y epel-release" do
  user "root"
  command "yum install -y epel-release"
  not_if "yum list installed | grep epel-release.noarch"
end

# リポジトリ追加(remi6)
execute "yum install -y http://rpms.famillecollet.com/enterprise/remi-release-6.rpm" do
  user "root"
  command "yum install -y http://rpms.famillecollet.com/enterprise/remi-release-6.rpm"
  not_if "yum list installed | grep remi-release.noarch"
end

# clockファイルの修正
execute "cp /etc/sysconfig/clock /etc/sysconfig/clock.org" do
  user "root"
  command "cp /etc/sysconfig/clock /etc/sysconfig/clock.org"
  not_if "test -e /etc/sysconfig/clock.org"
end

execute "ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime" do
  user "root"
  command "ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime"
end

remote_file "/etc/sysconfig/clock" do
  action :create
  owner "root"
  group "root"
  mode  "644"
  source "./files/etc/sysconfig/clock"
end

# i18nファイルの修正
execute "cp /etc/sysconfig/i18n /etc/sysconfig/i18n.org" do
  user "root"
  command "cp /etc/sysconfig/i18n /etc/sysconfig/i18n.org"
  not_if "test -e /etc/sysconfig/i18n.org"
end

remote_file "/etc/sysconfig/i18n" do
  action :create
  owner "root"
  group "root"
  mode  "644"
  source "./files/etc/sysconfig/i18n"
end

# hostsファイルの修正(host名反映)
execute "cp /etc/hosts /etc/hosts.erb.org" do
  user "root"
  command "cp /etc/hosts /etc/hosts.erb.org"
  not_if "test -e /etc/hosts.org"
end

template "/etc/hosts" do
  action :create
  owner "root"
  group "root"
  mode  "644"
  source "./templates/etc/hosts.erb"
end

# networkファイルの修正(host名反映)
execute "cp /etc/sysconfig/network /etc/sysconfig/network.org" do
  user "root"
  command "cp /etc/sysconfig/network /etc/sysconfig/network.org"
  not_if "test -e /etc/sysconfig/network.org"
end

template "/etc/sysconfig/network" do
  action :create
  owner "root"
  group "root"
  mode  "644"
  source "./templates/etc/sysconfig/network.erb"
end

# 必須ツールinstall
%w{vim git curl jq wget finger tree sysstat dstat ntp}.each do |pkg|
  package pkg
end

# メインユーザーの作成(セキュリティを考えてec2-userは後に削除する)
execute "useradd #{node[:server][:base][:username]}" do
  user "root"
  command "useradd #{node[:server][:base][:username]}"
  not_if "less /etc/passwd | grep #{node[:server][:base][:username]}"
end

template "/etc/sudoers.d/base.erb" do
  action :create
  owner "root"
  group "root"
  mode  "440"
  source "./templates/etc/sudoers.d/base.erb"
end
