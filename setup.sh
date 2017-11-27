#!/bin/bash

apt-get install -y python-software-properties debconf-utils
add-apt-repository -y ppa:webupd8team/java
apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
apt-get install -y oracle-java8-installer

wget https://www.dropbox.com/s/op3jttexge4ig2s/Azure%20ServiceBus%20Application.jar
java -jar "Azure ServiceBus Application.jar" DefaultEndpointsProtocol=https;AccountName=andersonshiva;AccountKey=ZpZVD8FhD7sg9/BSM1pWk9z2g8JhyJ0VipEVhXc8vX7GxeJvqkNVFeestim8tdAU03QEUvmfnVTmw55GvBnbOQ==;EndpointSuffix=core.windows.net Endpoint=sb://andersonshiva.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=rz+B4meO8sMBXsM+QQXjAeoFdNTgwcNamyXIdLnAQkk= locustrequests > log.txt &
