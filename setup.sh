#!/bin/bash

sudo su
apt-get install -y python-software-properties debconf-utils
add-apt-repository -y ppa:webupd8team/java
apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
apt-get install -y oracle-java8-installer

wget https://www.dropbox.com/s/4775kibts35l4ue/servicebus.jar
java -jar servicebus.jar &
