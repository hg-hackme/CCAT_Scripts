#!/bin/bash
rm -rf ~/.ssh/*;
rm -rf cdac@ccat2:~/.ssh/*;
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa;
sleep 2 
echo "yes\ncdac123" | ssh-copy-id -i ~/.ssh/id_rsa.pub cdac@ccat2;
sleep 2
ssh-add;
sleep 1
