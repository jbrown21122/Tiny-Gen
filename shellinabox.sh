#!/bin/bash

#Configuration entries
#WCG MODULE IP ADDRESS
#Auto retrieve IP
IP=`ip addr | grep inet | grep eth0 | awk '{print $2}' | sed s'|/24||g'`

#to manualy set an IP, uncomment the line below and enter your IP
#IP=192.168.122.22

#PORT FOR WEB ACCESS
PORT=4200

#DO NOT CHANGE ANYTHING BELOW THIS LINE
clear
echo "would you like to install Shell In A Box for web access to Tiny-Gen Control Center (tgcc)?"
echo 'y/n'
read reply
	if [ "$reply" = "y" ]
		then
			echo "enter tgcc user to add"
			read user
#Install package shellinabox
			yum install epel-release -y
			yum --enablerepo=epel install shellinabox -y
#create user and set startup and permissions
			useradd $user
			sudo usermod -aG wheel $user
			sudo passwd $user
			echo "sudo /usr/local/tinygen/tgcc" >> /home/$user/.bashrc
				if [ "$PORT" != "4200" ]
					then
					sed -i s'/PORT=4200/PORT=$PORT/g' /etc/sysconfig/shellinaboxd

				fi
#Start shellinabox
			systemctl start shellinaboxd
			systemctl enable shellinaboxd
			clear
#see if it is running
			echo "Checking to see if shellinabox is running and listening"
			sudo netstat -nap | grep shellinabox | grep 4200 > /dev/null
				if [ "$?" = "0" ]
					then
						echo RUNNING
						echo "Open a browser that has access to $IP"
						echo Navigate to https://$IP:$PORT
						echo log in as $user
						echo use $user password for sudo password
					else
						echo OOPS, Something went wrong
				fi


		else
			echo "OK, quitting then"
			exit 2
	fi



