#
# Cookbook Name:: cool_quotes
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nginx::default"

git "/srv" do
    repository 'https://github.com/Thr4wn/cool_quotes.git'
    reference "master"
    action :sync
end

