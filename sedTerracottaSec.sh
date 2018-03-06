#!/bin/bash
loc="/home/cdac/Downloads/CCAT_DeploymentPackage/InstallScripts"
	sed -i '40,47 {s/^/#/}' $loc/StartTerracottaServer.sh
	sed -i '48 i\ SERVER_TYPE=$SECONDARY' $loc/StartTerracottaServer.sh
	sed -i '62,65 {s/^/#/}' $loc/StartTerracottaServer.sh
	sed -i '66 i\ WISH=$YES' $loc/StartTerracottaServer.sh
	sed -i '75,76 {s/^/#/}' $loc/StartTerracottaServer.sh
