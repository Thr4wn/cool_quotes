#
# Cookbook Name:: cool_quotes
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#include_recipe "nginx::default"
#

package 'git'

directory "/usr/local/src/cool_quotes"

git "/usr/local/src" do
    repository 'https://github.com/Thr4wn/cool_quotes.git'
    reference "master"
    action :sync
end

remote_file "Copy rails app to /srv" do 
  path "/srv/cool_quotes_srv" 
  source "file:///usr/local/src/cool_quotes/rails_app"
end

application '/srv/cool_quotes_srv' do
  bundle_install do
    deployment true
    without %w{development test}
  end
  rails do
    database 'sqlite3:///db.sqlite3'
    #secret_token 'd78fe08df56c9'
    migrate true
  end
  unicorn do
    port 8000
  end
end

