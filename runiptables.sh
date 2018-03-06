#!/bin/bash
./iptables.sh primary
sshpass -p "cdac123" scp iptables.sh root@10.0.0.2:~/
sshpass -p "cdac123" ssh -o StrictHostKeyChecking=no root@10.0.0.2 -t './iptables.sh;exit'

