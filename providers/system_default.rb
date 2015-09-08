#
# Cookbook Name:: nvm
# Provider:: nvm_alias_default
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

# sets nvm node version in system path to make available to all users, must be run every time
# `nvm use v#.#.#` is run if node version is being updated or changed
# source: https://www.digitalocean.com/community/tutorials/how-to-install-node-js-with-nvm-node-version-manager-on-a-vps
action :create do
	bash "alias_default_default_node.js_#{new_resource.version}" do
    flags '-l'
    user 'root'
    group new_resource.group
		code <<-EOH
			source #{node['nvm']['source']}
			nvm use #{new_resource.version}
			n=$(which node); n=${n%/bin/node}; chmod -R 755 $n/bin/*; cp -r $n/{bin,lib,share} /usr
		EOH
	end

	new_resource.updated_by_last_action(true)
end
