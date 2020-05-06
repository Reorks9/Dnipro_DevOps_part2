#!/bin/bash
# Script for preconfigure system for run intermine solution https://github.com/intermine/intermine
# $1-PSQL_PWD

logged_user=$(who | tr -d '\n'| cut -d' ' -f1);
postgres_password=$1

function installApp () {
	cd ~;
	apt-get update >> /dev/null 2>&1;
	### postgresql
	apt-get -y install postgresql >> /dev/null 2>&1 &&
	echo "------> Install postgresql"
};

function setup () {
	PSQL_USER=$1;
	PSQL_PWD=$2;
	cd ~;
	### postgress
	sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/10/main/postgresql.conf;
	su postgres -c "psql -c \"CREATE ROLE $PSQL_USER SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN ENCRYPTED PASSWORD '$PSQL_PWD'\";";
	su postgres -c "psql -c \"CREATE DATABASE $PSQL_USER\";";
	echo "host	all	all	0.0.0.0/0	password" >> /etc/postgresql/10/main/pg_hba.conf;
	# echo "#####################" >> ~/.bashrc;
	# echo "export PSQL_USER=$PSQL_USER;" >> ~/.bashrc;
	# echo "export PSQL_PWD=$PSQL_PWD;" >> ~/.bashrc;

	service postgresql restart;

};

if [[ $# -ne 1 ]]; then
	echo "Parameters count must equal 1, run like 'sudo ./db.sh postgres_password && . ~/.bashrc;'";
	exit 1;
else
	if [[ $EUID -ne 0 ]]; then
   		echo "This script must be run as root, like 'sudo ./db.sh postgres_password && . ~/.bashrc;'";
   		exit 1;
	else
		installApp;
		setup $logged_user $postgres_password;
	fi;
fi;


