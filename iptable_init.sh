#export PATH=/etc/rc.d/init.d:$PATH
iptables -L -n

#清除自己设置的规则
#iptables -X

#清除所有规则
iptables -F

#设定预设规则
iptables -P INPUT DROP
#ptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
#iptables -P OUTPUT DROP
iptables -P FORWARD DROP
#iptables -P FORWARD ACCEPT

#开启常用端口
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 9003 -j ACCEPT
iptables -A INPUT -p tcp --dport 3000 -j ACCEPT
iptables -A INPUT -i lo -p all -j ACCEPT

iptables -A INPUT -s 58.100.180.52 -p tcp -j ACCEPT
iptables -A INPUT -s 112.10.158.189 -p tcp -j ACCEPT
