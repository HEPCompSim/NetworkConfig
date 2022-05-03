#deactivate ip v6 in /etc/sysctl.conf on all machines
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf

### Add local ip address:
if [ -z "$1" ]
then
	        echo "usage: ./setup_worker.sh <IP's last digit>"
		        exit -1
fi
ip addr add 192.168.1.10$1/24 dev enp4s0 label enp4s0:0

# add default gateway:
route add default gw 192.168.1.100 enp4s0

#For testing:
echo "gateway:"
route # 192.168.1.100 has to be default gateway
echo "My ip from outside is:"
curl ifconfig.me # has to be 148