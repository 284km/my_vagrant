NGINX_REPO = "/etc/yum.repos.d/nginx.repo"

node[:nginx] ||= {}

remote_file NGINX_REPO do
  source File.expand_path("../remote_files/nginx.repo", __FILE__)
  owner "root"
  group "root"
  mode "0644"
end

package "nginx"

# package "nginx" do
#   version "1.6.1"
# #  options "--force-yes"
# end

actions = []
actions << :start unless false == node[:nginx][:start]
actions << :enable unless false == node[:nginx][:enable]
actions << :nothing if actions.empty?

service "nginx" do
  action actions
end
