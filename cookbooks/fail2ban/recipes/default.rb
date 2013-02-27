#
# Cookbook Name:: fail2ban
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


package "fail2ban" do
  action :install
end

template "/etc/fail2ban/jail.conf" do
  source 'jail.conf.erb'
end

template "/etc/fail2ban/fail2ban.conf" do
  source 'fail2ban.conf.erb'
  
end
template "/etc/fail2ban/action.d/myadmin" do
  source 'myadmin.erb'
  
end


service "fail2ban" do
  action [:enable,:start]
end