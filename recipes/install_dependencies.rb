############################################################################
# Install dependencies

package 'libcurl3' do
  action :install
  only_if { ['debian', 'ubuntu'].include?(node['platform']) }
end

package 'curl' do
  action :install
end

if node['nvm']['install_deps_to_build_from_source']
  include_recipe 'build-essential'

  case node['platform']
  when 'debian', 'ubuntu'
    package 'libssl-dev' do
      action :install
    end
  when 'redhat', 'centos', 'fedora'

    package 'openssl-devel' do
      action :install
    end
  end
end
