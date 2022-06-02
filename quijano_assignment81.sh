#!/bin/sh

# Install httpd
yum install -y httpd

# start httpd
systemctl start httpd

# firewall to port 80
firewall-cmd --permanent --add-port=80/tcp

# firewall to port 443
firewall-cmd --permanent --add-port=443/tcp

# Reload firewall
firewall-cmd --reload

# enable httpd
systemctl enable httpd

yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum install -y yum-utils
yum-config-manager --enable remi-php56
yum install -y php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo

# restart httpd
systemctl restart httpd

# install mariadb
yum install -y mariadb-server mariadb

# start mariadb
systemctl start mariadb

mysql_secure_installation
systemctl enable mariadb
mysql -u root -p