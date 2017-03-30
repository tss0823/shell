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
iptables -A INPUT -p tcp --dport 6379 -j ACCEPT
iptables -A INPUT -p tcp --dport 9003 -j ACCEPT
iptables -A INPUT -p tcp --dport 9005 -j ACCEPT
#iptables -A INPUT -p tcp --dport 9006 -j ACCEPT
#iptables -A INPUT -p tcp --dport 8888 -j ACCEPT

#iptables -A INPUT -p tcp --dport 28080 -j ACCEPT
## deubg port
iptables -A INPUT -p tcp --dport 3999 -j ACCEPT
#iptables -A INPUT -p tcp --dport 3000 -j ACCEPT

#iptables -A INPUT -p tcp --dport 81 -j ACCEPT
iptables -A INPUT -p tcp --dport 3307 -j ACCEPT
#iptables -A INPUT -p tcp --dport 8081 -j ACCEPT
#iptables -A INPUT -p tcp --dport 28081 -j ACCEPT
#iptables -A INPUT -p tcp --dport 28082 -j ACCEPT
#iptables -A INPUT -p tcp --dport 28083 -j ACCEPT
#iptables -A INPUT -p tcp --dport 28084 -j ACCEPT
#iptables -A INPUT -p tcp --dport 28085 -j ACCEPT
iptables -A INPUT -i lo -p all -j ACCEPT

iptables -A INPUT -s 192.168.1.2 -p tcp -j ACCEPT
iptables -A INPUT -s 192.168.1.4 -p tcp -j ACCEPT

#iptables -A INPUT -s 112.10.158.194 -p tcp -j ACCEPT
iptables -A INPUT -s  124.160.28.69 -p tcp -j ACCEPT
