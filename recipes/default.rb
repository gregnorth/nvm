#
# Cookbook Name:: nvm
# Recipe:: default
#
# Copyright 2013, HipSnip Limited
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'git'
include_recipe 'nvm::install_dependencies'

directory node['nvm']['directory'] do
  user node['nvm']['user']
  group node['nvm']['group']
  action :create
end

directory '/usr/local/nvm' do
  user node['nvm']['user']
  group node['nvm']['group']
  action :create
end

directory '/usr/local/nvm/alias' do
  user node['nvm']['user']
  group node['nvm']['group']
  action :create
end

git node['nvm']['directory'] do
  user node['nvm']['user']
  group node['nvm']['group']
  repository node['nvm']['repository']
  reference node['nvm']['reference']
  action :sync
end

template node['nvm']['source'] do
  source 'nvm.sh.erb'
  mode 0755
  cookbook 'nvm'
  variables ({
    :nvm_directory => node['nvm']['directory']
  })
end
