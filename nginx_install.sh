#!/bin/bash
#install nginx
yum install gcc-c++
yum -y install zlib zlib-devel openssl openssl--devel pcre pcre-devel
wget http://nginx.org/download/nginx-1.9.15.tar.gz
tar -xf nginx-1.9.15.tar.gz
cd nginx-1.9.15
./configure 
make
make install


