#
# Cookbook Name:: yoshiso-base
# Recipe:: default
#
# Copyright 2014, Sho Yoshida
#
# All rights reserved - Do Not Redistribute
#


#
# Setting files for tmux
#

template "/home/#{node['user']}/.tmux.conf" do
  owner  node['user']
  group  node['user']
  mode   0644
  source ".tmux.conf"
end

#
# Setting files for vim
#

template "/home/#{node['user']}/.vimrc" do
	owner node['user']
	group node['user']
	mode 0644
	source ".vimrc"
end
