#
# Cookbook Name:: postfix
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

service 'sendmail' do
  action :disable
end

s

package "postfix"
package "cyrus-sasl-plain"

template "/etc/postfix" do
  source "main.cf.erb" 
end

service "postfix" do
  action [:enable, :start]
end

