#!/bin/bash
# Script for preconfigure system for run intermine solution https://github.com/intermine/intermine
# $1-PSQL_PWD
# $2-dbserver

logged_user=$(who | tr -d '\n'| cut -d' ' -f1);
dbpass=$1
dbserver=$2

function installApp () {
	cd ~;
	apt-get update >> /dev/null 2>&1;
	### git
	apt-get -y install git >> /dev/null 2>&1 &&
	echo "------> Install git"
	### java
	apt-get -y install openjdk-8-jdk >> /dev/null 2>&1 &&
	export JAVA_HOME=$(readlink -f $(which java)| rev | cut -d'/' -f3- | rev) &&
	echo "------> Install java"
	### perl
	apt-get -y install libxml-writer-perl libxml-sax-base-perl libxml-perl libxml-filter-saxt-perl libtext-glob-perl >> /dev/null 2>&1 &&
	echo "------> Install perl"
	# ### postgresql
	# apt-get -y install postgresql-client >> /dev/null 2>&1 &&
	# echo "------> Install postgresql"
	### tomcat
	wget "https://apache.volia.net/tomcat/tomcat-9/v9.0.34/bin/apache-tomcat-9.0.34.tar.gz" -O apache-tomcat-xyztar.gz >> /dev/null 2>&1 &&
	mkdir ~/tomcat/ &&
	tar -zxvf apache-tomcat-xyztar.gz -C ~/tomcat/ --strip-components=1 >> /dev/null 2>&1 &&
	echo "------> Install tomcat";
	### maven
	apt-get -y install maven >> /dev/null 2>&1 &&
	echo "------> Install maven";
	### solr
	cd /opt >> /dev/null 2>&1 &&
	wget "http://archive.apache.org/dist/lucene/solr/7.2.1/solr-7.2.1.tgz" -O solr.tgz >> /dev/null 2>&1 &&
	tar -zxf solr.tgz &&
	chown -R $logged_user:$logged_user * &&
	echo "------> Install solr";
};

function setup () {
	PSQL_USER=$1;
	PSQL_PWD=$2;
	dbserver=$3;
	cd ~;
	### postgress
	echo "#####################" >> ~/.bashrc;
	echo "export PSQL_USER=$PSQL_USER;" >> ~/.bashrc;
	echo "export PSQL_PWD=$PSQL_PWD;" >> ~/.bashrc;
	echo "export SERVER=$dbserver;" >> ~/.bashrc;
	### tomcat
	sed -i "s#securerandom.source=file:/dev/random#securerandom.source=file:/dev/./urandom#g" "$JAVA_HOME/lib/security/java.security";
	#sed -i "s/Connector port=\"8080\"/Connector port=\"\${port.http}\"/g" ~/tomcat/conf/server.xml;
	#echo "export CATALINA_HOME=/home/ubuntu/apache-tomcat-9.0.34;" >> ~/.bashrc;
	echo "export JAVA_HOME=$JAVA_HOME;" >> ~/.bashrc;
	echo "export JRE_HOME=$JAVA_HOME;" >> ~/.bashrc;
	echo "export PATH=$PATH:$JAVA_HOME/bin;" >> ~/.bashrc;
	echo "export JAVA_OPTS=\"-Djava.awt.headless=true -server\";" >> ~/.bashrc;
	### solr
	su $logged_user -c "/opt/solr-7.2.1/bin/solr start >> /dev/null 2>&1;";
	su $logged_user -c "/opt/solr-7.2.1/bin/solr create -c intermine-search >> /dev/null 2>&1;";
	su $logged_user -c "/opt/solr-7.2.1/bin/solr create -c intermine-autocomplete >> /dev/null 2>&1;";
	git clone "https://github.com/intermine/intermine.git" >> /dev/null 2>&1;
	
};

function changeOwner () {
	cd ~;
	chown -R $logged_user:$logged_user *;
};

if [[ $# -ne 2 ]]; then
	echo "Parameters count must equal 2, run like 'sudo ./build.sh dbpass dbserver && . ~/.bashrc;'";
	exit 1;
else
	if [[ $EUID -ne 0 ]]; then
   		echo "This script must be run as root, like 'sudo ./build.sh dbpass dbserver && . ~/.bashrc;'";
   		exit 1;
	else
		installApp;
		setup $logged_user $dbpass $dbserver;
		changeOwner;
	fi;
fi;