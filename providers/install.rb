#
# Cookbook Name:: nvm
# Provider:: nvm_install
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

action :create do

	from_source_message = new_resource.from_source ? ' _from_source' : ''
	from_source_arg = new_resource.from_source ? '-s' : ''

	bash "install_node_js_#{new_resource.version}#{from_source_message}" do
    flags '-l'
    user new_resource.user
    group new_resource.group
		code <<-EOH
			source #{node['nvm']['source']}
			nvm install #{from_source_arg} #{new_resource.version}
		EOH
	end

	nvm_system_default "system_default_#{new_resource.version}" do
		version new_resource.version
    user new_resource.user
    group new_resource.group
		action :create
		only_if { new_resource.set_system_default }
	end
	new_resource.updated_by_last_action(true)
end
