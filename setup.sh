yum update -y
yum install -y curl
yum install -y socat

bash <(curl -Ls https://raw.githubusercontent.com/FranzKafkaYu/x-ui/master/install.sh)

firewall-cmd --permanent --add-port=54321/tcp --add-port=12345/tcp #开放端口（54321是面板端口，12345是后面节点要用的）
firewall-cmd --permanent --list-ports #查看防火墙的开放的端口
firewall-cmd --reload #重启防火墙(修改配置后要重启防火墙)

echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p
sysctl -n net.ipv4.tcp_congestion_control
lsmod | grep bbr
