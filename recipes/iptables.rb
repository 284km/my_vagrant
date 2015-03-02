template "iptables" do
  path   "/etc/sysconfig/iptables"
  source "templates/iptables"
  mode   "600"
end

service "iptables" do
  subscribes :restart, "template[iptables]"
end
