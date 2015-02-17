require 'itamae/plugin/resource/iptables'

# 初期化
iptables_flush 'flush' do
end

# 入力(INPUT)は許可したもの以外は破棄(DROP)
iptables_policy 'INPUT' do
  action :drop
end

# 出力(OUTPUT)は基本的に許可(ACCEPT)
iptables_policy 'OUTPUT' do
  action :accept
end

# 転送(FORWARD)は許可したもの以外は破棄(DROP)
iptables_policy 'FORWARD' do
  action :drop
end

# ローカルループバックインターフェースからのパケットは許可
iptables_rule 'accept loopback' do
  action :accept
  chain 'INPUT'
  in_interface 'lo'
end

# icmpパケットを許可
iptables_rule 'accept ping' do
  action :accept
  chain 'INPUT'
  protocol 'icmp'
end

# 接続済みの通信に関するパケットを許可
iptables_rule 'accept related,established' do
  action :accept
  chain 'INPUT'
  state %w[RELATED ESTABLISHED]
end

# # ip偽装対策1(プライベートアドレスからのパケットは破棄)
# -A INPUT -s 10.0.0.0/8 -j DROP
# -A INPUT -s 172.16.0.0/12 -j DROP
# -A INPUT -s 192.168.0.0/16 -j DROP
# 
# # ip偽装対策2(特殊なアドレスからのパケットを拒否)
# -A INPUT -s 127.0.0.0/8 -j DROP     # ローカルループバックアドレス
# -A INPUT -s 169.254.0.0/16 -j DROP  # ローカルアドレス
# -A INPUT -s 192.0.2.0/24 -j DROP    # TEST-NET
# -A INPUT -s 224.0.0.0/4 -j DROP     # クラスD
# -A INPUT -s 240.0.0.0/5 -j DROP     # クラスE
# 
# # Smarf攻撃対策(ブロードキャストパケットの破棄)
# -A INPUT -d 0.0.0.0/8 -j DROP
# -A INPUT -d 255.255.255.255/32 -j DROP
# COMMIT

iptables_rule 'accept from local' do
  action :accept
  chain 'INPUT'
  # source '192.168.10.0/24'
  source '192.168.0.0/16'
end

iptables_chain 'SSH_LOGGING' do
end

iptables_rule 'chain ssh' do
  action :create
  chain 'INPUT'
  protocol 'tcp'
  dport 22
  state %w[NEW]
  jump 'SSH_LOGGING'
end

iptables_rule 'log ssh' do
  action :log
  chain 'SSH_LOGGING'
  log_prefix '[ssh] '
  log_level 'info'
end

iptables_rule 'accept ssh' do
  action :accept
  chain 'SSH_LOGGING'
end

iptables_chain 'HTTP' do
end

iptables_rule 'chain http' do
  action :create
  chain 'INPUT'
  protocol 'tcp'
  dport 80
  state %w[NEW]
  jump 'HTTP'
end

iptables_rule 'accept http' do
  action :accept
  chain 'HTTP'
end

iptables_chain 'HTTPS' do
end

iptables_rule 'chain https' do
  action :create
  chain 'INPUT'
  protocol 'tcp'
  dport 443
  state %w[NEW]
  jump 'HTTPS'
end

iptables_rule 'accept https' do
  action :accept
  chain 'HTTPS'
end

iptables_save '/etc/iptables/iptables.rules' do
end

service 'iptables.service' do
  action [:enable, :start]
end
