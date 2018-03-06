#!/bin/bash
echo " ___________________________________________________________________________________________________________________ "
echo "|    ______    ___    ___         _________   ___   __    ________        _______    _______    ______   _________  |"
echo "|   / /__\ \   | |    | |         |___  ___|  |  |__|  |  | |_____        | |    )   | |____    |        |___   __| |"
echo "|  / /____\ \  | |__  | |__          |  |     |   __   |  | |_____)       | |====|   | |____)   \====\      |  |    |"
echo "| (_/      \_) |____) |____)         |__|     |__|  |__|  |_|______       |_|____)   |_|_____    _____)     |__|    |"
echo "|__________________________________________________________________________________________________________ ________|"



dat=""
tym=""
echo ""
echo ""
echo ""

echo -e "Enter Date (DD MMM YYYY): ............ ;Example: 10 Dec 2017"
read date
echo -e "Enter Time 24 Hour Format (HH:MM:SS): .............;Example: 13:40:55"
read tym


echo cdac123| sudo -S date -s "$dat $tym +5:30"
sleep 5
sshpass -p "cdac123" ssh -o StrictHostKeyChecking=no root@10.0.0.2 -t "date -s '$date $tym +5:30' ;exit"

 
sshpass -p "cdac123" ssh -o StrictHostKeyChecking=no cdac@10.0.0.2 -t 'rm -rf ~/.ssh/* ;exit'
