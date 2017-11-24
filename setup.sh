#!/bin/bash

apt-get install -y python-software-properties debconf-utils
add-apt-repository -y ppa:webupd8team/java
apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
apt-get install -y oracle-java8-installer

wget https://www.dropbox.com/s/zpkdkyf0c9pkupu/Azure%20ServiceBus%20Application.jar
#nohup java -jar "Azure ServiceBus Application.jar" &

# create a service
touch /etc/systemd/system/workserver.service
printf '[Unit]\nDescription=workServer Service\nAfter=rc-local.service\n' >> /etc/systemd/system/workserver.service
printf '[Service]\nWorkingDirectory=%s\n' $workserver_path >> /etc/systemd/system/workserver.service
printf 'ExecStart=java -jar "Azure ServiceBus Application.jar"\n' $workserver_path >> /etc/systemd/system/workserver.service
printf 'ExecReload=/bin/kill -HUP $MAINPID\nKillMode=process\nRestart=on-failure\n' >> /etc/systemd/system/workserver.service
printf '[Install]\nWantedBy=multi-user.target\nAlias=workserver.service' >> /etc/systemd/system/workserver.service
chmod +x /etc/systemd/system/workserver.service

service workserver start
