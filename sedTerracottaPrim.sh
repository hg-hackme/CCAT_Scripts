#!/bin/bash
path="/home/cdac/Downloads/CCAT_DeploymentPackage/InstallScripts"
	sed -i '40,47 {s/^/#/}' $path/StartTerracottaServer.sh
	sed -i '48 i\ SERVER_TYPE=$PRIMARY' $path/StartTerracottaServer.sh
	sed -i '62,65 {s/^/#/}' $path/StartTerracottaServer.sh
	sed -i '66 i\ WISH=$YES' $path/StartTerracottaServer.sh
	sed -i '75,76 {s/^/#/}' $path/StartTerracottaServer.sh
