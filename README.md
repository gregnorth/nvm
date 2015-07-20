# nvm

Chef cookbook for setting up NVM from [creationix's github repository](https://github.com/creationix/nvm).

## Requirements

The following platforms are tested directly under test-kitchen; see .kitchen.yml for details.

- CentOS 6.6, 7.1
- Ubuntu 12.04

The following platforms are known to work:

- Debian family (Ubuntu)
- Red Hat family (CentOS)

## Usage

Install nvm and node.js version 0.10.5.

	# install nvm
	include_recipe 'nvm'

	# install node.js v0.10.5
	nvm_install 'v0.10.5'  do
		from_source false
		set_system_default true
		action :create
	end

For more usage examples, have a look to the recipes in `test/cookbooks/nvm_test/recipes/`.

## Attributes

* `node['nvm']['directory']` - directory where nvm is cloned, default '/usr/local/src/nvm'
* `node['nvm']['repository']` - url of the git repository, default 'git://github.com/creationix/nvm.git'
* `node['nvm']['reference']` - reference in the repository, default 'master'
* `node['nvm']['source']` - command to source nvm script file, default 'source /etc/profile.d/nvm.sh'
* `node['nvm']['install_deps_to_build_from_source']` - if true install the dependencies to compile node, otherwise not, default true

## LWRPs

### nvm_install

Install a node.js version from source or binaries

#### Actions

- `create` (default)

#### Attributes

- `version` - node.js version, default to the name attribute
- `from_source` - install from source if true, default to false
- `set_system_default` - set the current version as the system default, default true

#### Examples

Install from binary

	nvm_install '0.10.5'  do
		from_source false
		set_system_default true
		action :create
	end

Install from source

	nvm_install '0.10.5'  do
		from_source true
		set_system_default true
		action :create
	end


### nvm_system_default

Use by default the given node.js version

#### Actions

- `create` (default)

#### Attributes

- `version` - node.js version, default to the name attribute

#### Example

Use by default node.js version 0.10.0

	nvm_system_default '0.10.0'  do
		action :create
	end

## Test

    kitchen test

## Licence

Author: Rémy Loubradou

Copyright 2013 HipSnip Limited

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
