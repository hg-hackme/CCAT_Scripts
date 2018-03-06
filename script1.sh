#!/bin/bash
if  [[ $1 = "primary" ]]; then
pkill -9 java; sleep 2; cd /home/cdac; sleep 2; rm -rf server; sleep 2; rm -rf terracotta; sleep 2; cd /home/cdac/Downloads; sleep 2; rm -rf * ## if required
cp /home/cdac/Desktop/CCAT_DeploymentPackage.tar.gz /home/cdac/Downloads/;
sleep 2 
tar -zxvf /home/cdac/Downloads/CCAT_DeploymentPackage.tar.gz;
sleep 3
cd /home/cdac/Downloads/CCAT_DeploymentPackage/dhcp
echo cdac123 | sudo -S rpm -Uvh dhcp-common-4.1.1-34.P1.el6.centos.i686.rpm --force
echo cdac123 | sudo -S rpm -Uvh dhcp-4.1.1-34.P1.el6.centos.i686.rpm --force
echo cdac123 | sudo -S cp PrimaryDHCP.conf /etc/dhcp/dhcpd.conf
echo cdac123 | sudo -S chown -R root:root /var/lib/dhcpd;
sleep 2
echo cdac123 | sudo service dhcpd restart

else
pkill -9 java; sleep 2; cd /home/cdac; sleep 2; rm -rf server; sleep 2; rm -rf terracotta; sleep 2; cd /home/cdac/Downloads; sleep 2; rm -rf * ## if required
cp /home/cdac/Desktop/CCAT_DeploymentPackage.tar.gz /home/cdac/Downloads/;
sleep 2 
tar -zxvf /home/cdac/Downloads/CCAT_DeploymentPackage.tar.gz;
sleep 3
cd /home/cdac/Downloads/CCAT_DeploymentPackage/dhcp
echo cdac123 | sudo -S rpm -Uvh dhcp-common-4.1.1-34.P1.el6.centos.i686.rpm --force
echo cdac123 | sudo -S rpm -Uvh dhcp-4.1.1-34.P1.el6.centos.i686.rpm --force
echo cdac123 | sudo -S cp SecondaryDHCP.conf /etc/dhcp/dhcpd.conf
echo cdac123 | sudo -S chown -R root:root /var/lib/dhcpd;
sleep 2
echo cdac123 | sudo service dhcpd restart
fi

if  [[ $1 = "primary" ]]; then
cd /home/cdac/Downloads/CCAT_DeploymentPackage/dns
echo cdac123 | sudo rpm -Uvh bind-* --force
echo cdac123 | sudo cp MasterNamed.conf /var/named/chroot/etc/named.conf
echo cdac123 | sudo cp *arpa.zone /var/named/chroot/var/named/
echo cdac123 | sudo cp ccat.zone /var/named/chroot/var/named/ccat.zone;
echo cdac123 | sudo chown -R named:named /var/named/chroot/var/named
echo cdac123 | sudo service named restart
echo cdac123 | sudo iptables -F;
echo cdac123 | sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080;
sleep 2

else
cd /home/cdac/Downloads/CCAT_DeploymentPackage/dns
echo cdac123 | sudo rpm -Uvh bind-* --force
echo cdac123 | sudo cp SlaveNamed.conf /var/named/chroot/etc/named.conf;
echo cdac123 | sudo chown -R named:named /var/named/chroot/var/named
echo cdac123 | sudo service named restart 
echo cdac123 | sudo iptables -F;
echo cdac123 | sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080;
sleep 2
fi
