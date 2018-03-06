#!/bin/bash
path="/home/cdac/Downloads/CCAT_DeploymentPackage/InstallScripts"
	sed -i '61,62 {s/^/#/}' $path/StartApache.sh
	sed -i '63 i\ SERVER_TYPE=10.0.0.1' $path/StartApache.sh
