#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2013, Myles Carrick
#
#
include_recipe "ruby_build"
include_recipe "rbenv::system_install"

version = "1.9.3-p362"

rbenv_ruby version do
  action :install
end

rbenv_global version

# prereqs
%w(rake bundler chef).each do |gem|
  gem_package gem
end

rbenv_rehash "Rehash the rubies"