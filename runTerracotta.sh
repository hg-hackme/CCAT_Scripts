#!/bin/bash


sshpass -p "cdac123" scp /home/cdac/Downloads/CCAT_DeploymentPackage/InstallScripts/sedTerracottaSec.sh cdac@ccat2:/home/cdac/Downloads/CCAT_DeploymentPackage/InstallScripts/

gnome-terminal --tab -e "bash -c \" cd /home/cdac/Downloads/CCAT_DeploymentPackage/InstallScripts; sh sedTerracottaPrim.sh; sh ~/Downloads/CCAT_DeploymentPackage/InstallScripts/StartTerracottaServer.sh; exec bash\""  --tab -e "bash -c \" sleep 10; ssh cdac@ccat2 -t 'cd /home/cdac/Downloads/CCAT_DeploymentPackage/InstallScripts; sh sedTerracottaSec.sh; sh ~/Downloads/CCAT_DeploymentPackage/InstallScripts/StartTerracottaServer.sh; bash;' exec bash\""

