include_recipe 'base.rb'

# TODO: firewall.rb
# include_recipe 'firewall.rb'

include_recipe 'ruby_build.rb'
include_recipe 'nodejs.rb'
include_recipe 'nginx.rb'

# include_recipe 'sl_recipe.rb'

directory "/var/www" do
  mode "775"
  owner "vagrant"
  group "vagrant"
end

