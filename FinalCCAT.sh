#!/bin/bash

sh runssh.sh;
sleep 2
sh ssh.sh;
sleep 2
sh runscript1.sh;
sleep 5
#sh runscript2.sh;
cp sedConfigCCAT.sh ~/Downloads/CCAT_DeploymentPackage/InstallScripts/;
sleep 2
cp runTerracotta.sh ~/Downloads/CCAT_DeploymentPackage/InstallScripts/;
sleep 2
cp sedTerracottaPrim.sh ~/Downloads/CCAT_DeploymentPackage/InstallScripts/;
sleep 2
cp sedTerracottaSec.sh ~/Downloads/CCAT_DeploymentPackage/InstallScripts/;
sleep 2
cp script4.sh ~/Downloads/CCAT_DeploymentPackage/InstallScripts/;
sleep 2
cp runscript4.sh ~/Downloads/CCAT_DeploymentPackage/InstallScripts/;
sleep 2
cp sedApachePrim.sh ~/Downloads/CCAT_DeploymentPackage/InstallScripts/;
sleep 2
cp sedApacheSec.sh ~/Downloads/CCAT_DeploymentPackage/InstallScripts/;
sleep 2
cp runApache.sh ~/Downloads/CCAT_DeploymentPackage/InstallScripts/;
sleep 2
cd ~/Downloads/CCAT_DeploymentPackage/InstallScripts/;
sleep 2
sh sedConfigCCAT.sh
sleep 10
source ConfigCCAT.sh
sleep 100
sh runTerracotta.sh;
sleep 40
cd ~/Downloads/CCAT_DeploymentPackage/InstallScripts/;
sleep 5
sh runscript4.sh;
sleep 5
cd ~/Downloads/CCAT_DeploymentPackage/InstallScripts/;
sleep 5
sh runApache.sh;
sleep 40
cd /home/cdac/Desktop/CCEEScripts;
sleep 2
sh runiptables.sh;
sleep 2

echo "Server is configured Successfully."
echo "Now you can open web Browser & Enter:."
echo "ccat.cdac.in:8080/ccat_local/csMenu"
echo "Student Login : http://ccat.cdac.in"
