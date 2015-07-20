include_recipe 'nvm'

node.set['nvm']['install_deps_to_build_from_source'] = true
version = 'v0.10.35'

nvm_install version  do
	from_source true
	set_system_default true
	action :create
end
