#!/bin/bash


sshpass -p "cdac123" scp /home/cdac/Downloads/CCAT_DeploymentPackage/InstallScripts/sedApacheSec.sh cdac@ccat2:/home/cdac/Downloads/CCAT_DeploymentPackage/InstallScripts/

gnome-terminal --tab -e "bash -c \" cd /home/cdac/Downloads/CCAT_DeploymentPackage/InstallScripts; sh sedApachePrim.sh; sh ~/Downloads/CCAT_DeploymentPackage/InstallScripts/StartApache.sh; exec bash\""  --tab -e "bash -c \" sleep 5; ssh cdac@ccat2 -t 'cd /home/cdac/Downloads/CCAT_DeploymentPackage/InstallScripts; sh sedApacheSec.sh; sh ~/Downloads/CCAT_DeploymentPackage/InstallScripts/StartApache.sh; bash;' exec bash\""

