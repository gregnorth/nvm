include_recipe 'nvm'

version = 'v0.10.35'

nvm_install version  do
	from_source false
	set_system_default true
	action :create
end
