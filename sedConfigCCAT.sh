#!/bin/bash
path="/home/cdac/Downloads/CCAT_DeploymentPackage/InstallScripts"
	sed -i '2,9 {s/^/#/}' $path/ConfigCCAT.sh
	sed -i '19,20 {s/^/#/}' $path/ConfigCCAT.sh
	sed -i '24,25 {s/^/#/}' $path/ConfigCCAT.sh
	sed -i '63,64 {s/^/#/}' $path/ConfigCCAT.sh
	sed -i '150,151 {s/^/#/}' $path/ConfigCCAT.sh
	sed -i '152 i\ PRIMARY_IP=10.0.0.1' $path/ConfigCCAT.sh
	sed -i '153 i\ SECONDARY_IP=10.0.0.2' $path/ConfigCCAT.sh
	sed -i '104,111 {s/^/#/}' $path/ConfigCCAT.sh
	sed -i '177 {s/^/#/}' $path/ConfigCCAT.sh
	sed -i '178 i\ scp -r $CCAT_ROOT cdac@$SECONDARY_IP:$CCAT_LOC' $path/ConfigCCAT.sh
	sed -i '179 i\ scp -r ~/.bashrc cdac@$SECONDARY_IP:~/' $path/ConfigCCAT.sh
	sed -i '184,187 {s/^/#/}' $path/ConfigCCAT.sh
	
	
	
