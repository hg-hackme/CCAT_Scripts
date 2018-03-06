#!/bin/bash
if  [[ $1 = "primary" ]]; then
cd /home/cdac/Downloads/CCAT_DeploymentPackage/
tar -xvzf CCATEXAM.tar.gz
cd /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM
tar -xvzf jdk-7u21-linux-i586.tar.gz
JAVA_HOME=/home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/jdk1.7.0_21
echo "JAVA_HOME=$JAVA_HOME" >> ~/.bashrc 
echo "export JAVA_HOME" >> ~/.bashrc
echo "PATH=$JAVA_HOME/bin:$PATH" >> ~/.bashrc
echo "export PATH" >> ~/.bashrc
source ~/.bashrc
echo -e "\n[INFO:] Checking Java Version"
java -version


ip1="PRIMARY=10.0.0.1"
ip2="SECONDARY=10.0.0.2"

cat >/home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/config/ipAddr.properties<<EOL
$ip1
$ip2
EOL

. /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/config/ipAddr.properties

cp /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config_1.xml /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config.xml	
sed "s/primaryIp/10.0.0.1/g" /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config.xml > /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config_temp.xml
cp /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config_temp.xml /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config.xml

sed "s/secondaryIp/10.0.0.2/g" /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config.xml > /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config_temp.xml
cp /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config_temp.xml /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config.xml

	
serverData="~/terracotta/terracotta-server-logs/server-data"
serverLogs="~/terracotta/terracotta-server-logs/server-logs"
serverStatistics="~/terracotta/terracotta-server-logs/server-statistics"
dataBackup="~/terracotta/terracotta-server-logs/data-backup"
index="~/terracotta/terracotta-server-logs/server-data/index"
clientLogs="~/terracotta/terracotta-client-logs"

sed "s|serverData|$serverData|g" /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config.xml > /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config_temp.xml
cp /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config_temp.xml /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config.xml

sed "s|serverLogs|$serverLogs|g" /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config.xml > /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config_temp.xml
cp /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config_temp.xml /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config.xml

sed "s|serverStatistics|$serverStatistics|g" /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config.xml > /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config_temp.xml
cp /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config_temp.xml /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config.xml

sed "s|dataBackup|$dataBackup|g" /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config.xml > /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config_temp.xml
cp /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config_temp.xml /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config.xml

sed "s|serverIndex|$index|g" /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config.xml > /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config_temp.xml
cp /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config_temp.xml /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config.xml

sed "s|terracotta-client-logs|$clientLogs|g" /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config.xml > /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config_temp.xml
cp /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config_temp.xml /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/Terracotta/terracotta-3.7.2/config/tc-config.xml


cp /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/config_ccat.properties /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/config/config_ccat.properties

. ~/Downloads/CCAT_DeploymentPackage/CCATEXAM/config/config_ccat.properties

KSPASS=$(~/Downloads/CCAT_DeploymentPackage/InstallScripts/ReadAlphaNumericOnly.sh cdac123)

KSPASS1=$(~/Downloads/CCAT_DeploymentPackage/InstallScripts/Encode.sh cdac123)

cd ~/Downloads/CCAT_DeploymentPackage/CCATEXAM/apache-tomcat-6.0.36/webapps/ccat_local/keystore
rm -rf ks
keytool -genkey -alias ccatks -keyalg RSA -keypass $KSPASS -storepass $KSPASS -keysize 2048 -keystore ks
	
cp ks ~/Downloads/ks_$(date +%d_%m_%Y_%H_%M_%S)

sed "s/KeystorePassword/$KSPASS1/g" ~/Downloads/CCAT_DeploymentPackage/CCATEXAM/config/config_ccat.properties > ~/Downloads/CCAT_DeploymentPackage/CCATEXAM/config/config_ccat_temp.properties
cp ~/Downloads/CCAT_DeploymentPackage/CCATEXAM/config/config_ccat_temp.properties ~/Downloads/CCAT_DeploymentPackage/CCATEXAM/config/config_ccat.properties
rm -rf ~/Downloads/CCAT_DeploymentPackage/CCATEXAM/config/config_ccat_temp.properties
#scp ~/authorized_keys cdac@10.0.0.2:~/.ssh/
SSH_AUTH_SOCK=0 scp -r /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM cdac@10.0.0.2:/home/cdac/Downloads/CCAT_DeploymentPackage/
SSH_AUTH_SOCK=0 scp ~/.bashrc cdac@10.0.0.2:~/


fi 
