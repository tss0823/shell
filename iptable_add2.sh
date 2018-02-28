#export PATH=/etc/rc.d/init.d:$PATH

iptables -A INPUT -s  $1 -p tcp -j ACCEPT

# drop
#iptables -I INPUT -s 112.10.158.216 -j DROP
