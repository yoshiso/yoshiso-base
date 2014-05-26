#
# Cookbook Name:: yoshiso-base
# Recipe:: default
#
# Copyright 2014, Sho Yoshida
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'yoshiso-yum-repos'
include_recipe 'yoshiso-base::setting'

#
# Install Packages
#

packages = %w{ tmux wget zip unzip git vim }
packages.each do |pkg|
  package pkg do
  	options "--enablerepo=epel,remi"
  	action :install
  end
end

#
# Installing NeoBundle
#
home = "/home/#{node['user']}"
bash "Install NeoBundle" do
	cwd  home
	user node['user']
	code "[ ! -d #{home}/.vim/bundle ] && mkdir -p #{home}/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim #{home}/.vim/bundle/neobundle.vim && vim -c ':NeoBundleInstall'"
	action :run
	not_if { ::File.exists?("#{home}/.vim/bundle/neobundle.vim") }
end