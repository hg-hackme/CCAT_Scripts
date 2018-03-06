#!/bin/bash
if  [[ $1 = "primary" ]]; then
	OK="TCP server running at"
	IN_USE="Address already in use"


	sed -i.bak -e 's/\r//g' /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/config/ipAddr.properties
	sed -i.bak -e 's/\r//g' /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/config/config_ccat.properties

	. /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/config/ipAddr.properties

	rm -rf /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/h2
	unzip /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/h2-2014-04-05.zip -d /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM

	echo -e "\nStarting H2 Server !!"

	rm -rf nohup.out

	nohup java -cp /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/h2/bin/h2-1.3.176.jar org.h2.tools.Server -tcp -tcpPort 9101 -tcpAllowOthers -baseDir /home/cdac/server &
	sleep 5

	if grep -qs $OK nohup.out
	then
		echo "H2 Server Started Successfully !"
		
	elif grep -qs $IN_USE nohup.out
	then
		echo "H2 Server Already Running !"
		echo -n "Do you want to restart ? (YES/NO) : "

		read WISH
		
		if [ $WISH == 'YES' ]
		then
			pid=$(lsof -i:9101 -t); kill -TERM $pid || kill -KILL $pid
			sh $CCAT_SCRIPTS/StartH2Server.sh
		else
			echo -e "Exiting ..."
			exit 1
		fi
	else
		echo -e "Exiting ..."
		exit 1
	fi


else 

	OK="TCP server running at"
	IN_USE="Address already in use"


	sed -i.bak -e 's/\r//g' /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/config/ipAddr.properties
	sed -i.bak -e 's/\r//g' /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/config/config_ccat.properties

	. /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/config/ipAddr.properties

	rm -rf /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/h2
	unzip /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/h2-2014-04-05.zip -d /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM

	echo -e "\nStarting H2 Server !!"

	rm -rf nohup.out

	nohup java -cp /home/cdac/Downloads/CCAT_DeploymentPackage/CCATEXAM/h2/bin/h2-1.3.176.jar org.h2.tools.Server -tcp -tcpPort 9101 -tcpAllowOthers -baseDir /home/cdac/server &
	sleep 5

	if grep -qs $OK nohup.out
	then
		echo "H2 Server Started Successfully !"
		
	elif grep -qs $IN_USE nohup.out
	then
		echo "H2 Server Already Running !"
		echo -n "Do you want to restart ? (YES/NO) : "

		read WISH
		
		if [ $WISH == 'YES' ]
		then
			pid=$(lsof -i:9101 -t); kill -TERM $pid || kill -KILL $pid
			sh $CCAT_SCRIPTS/StartH2Server.sh
		else
			echo -e "Exiting ..."
			exit 1
		fi
	else
		echo -e "Exiting ..."
		exit 1
	fi

fi
