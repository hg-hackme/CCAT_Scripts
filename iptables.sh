#!/bin/bash
if  [[ $1 = "primary" ]]; then
rm -rf /tmp/out
ifconfig >> /tmp/out
lan=$(head -n 1 /tmp/out | cut -d " " -f1)
#echo $lan
sudo iptables -F
sudo iptables -t nat -A PREROUTING -i $lan -p tcp --dport 80 -j REDIRECT --to-port 8080
#echo "Started"

else
rm -rf /tmp/out
ifconfig >> /tmp/out
lan=$(head -n 1 /tmp/out | cut -d " " -f1)
#echo $lan
sudo iptables -F
sudo iptables -t nat -A PREROUTING -i $lan -p tcp --dport 80 -j REDIRECT --to-port 8080
#echo "Started"

fi
