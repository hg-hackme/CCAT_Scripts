#!/bin/bash
./script1.sh primary
sshpass -p "cdac123" scp script1.sh cdac@10.0.0.2:~/
sshpass -p "cdac123" ssh -o StrictHostKeyChecking=no cdac@10.0.0.2 -t './script1.sh;exit'

