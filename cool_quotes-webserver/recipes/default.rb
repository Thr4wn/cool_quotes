#
# Cookbook Name:: cool_quotes
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

WEBROOT = '/var/www/nginx-default'

include_recipe 'apt'
include_recipe "nginx::default"

directory '/var/www' do
    mode '0755'
end
directory WEBROOT do
    mode '0755'
end

package 'git'
directory "/usr/local/src"
directory "/usr/local/src/cool_quotes"
git "/usr/local/src/cool_quotes" do
    repository 'https://github.com/Thr4wn/cool_quotes.git'
    reference "master"
    action :sync
end

#TODO: rsync or something way better than this.
execute "sudo rm -rf #{WEBROOT}/*"
execute "sudo cp -R /usr/local/src/cool_quotes/static_app/* #{WEBROOT}"


############################################
############################################

#package 'git'

# needed for rails' bundle install
#package 'libsqlite3-dev'
#package 'sqlite3' 
#package 'build-essential' 

#directory "/usr/local/src/cool_quotes"

#git "/usr/local/src/cool_quotes" do
    #repository 'https://github.com/Thr4wn/cool_quotes.git'
    #reference "master"
    #action :sync
#end

#remote_directory "Copy rails app to /srv" do 
  #path "/srv/cool_quotes_srv" 
  #source "file:///usr/local/src/cool_quotes/rails_app"
#end

#TODO: rsync or something way better than this.
#execute "sudo rm -rf /srv/cool_quotes_srv"
#execute "sudo cp -R /usr/local/src/cool_quotes/rails_app /srv/cool_quotes_srv"

# https://supermarket.chef.io/cookbooks/application_ruby
#application '/srv/cool_quotes_srv' do
  #bundle_install do
    ##user 'ubuntu'
    #deployment true
    #without %w{development test}
  #end
  #rails do
    #database 'sqlite3:///db.sqlite3'
    ##secret_token 'd78fe08df56c9'
    #migrate true
  #end
  #unicorn do
    #port 8765
  #end
#end

