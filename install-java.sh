#! /usr/bin/env bash
#sudo apt-get update

JAVA_VERSION=8
JAVA_HOME="/usr/lib/jvm/java-$JAVA_VERSION-oracle"

default() {
	sudo apt-get update
	sudo apt-get install default-jre
	sudo apt-get install default-jdk
}

set_java_home_enviroment_variable(){
	echo "Setting the JAVA_HOME Environment Variable"
	JAVA_HOME="/usr/lib/jvm/java-$JAVA_VERSION-oracle"
	
	OS="`uname`"
	case $OS in
  		'Linux')
    	OS='Linux'
    	alias ls='ls --color=auto'
    	echo "Please set <JAVA_HOME="/usr/lib/jvm/java-$JAVA_VERSION-oracle"> to /etc/environment"
    	echo "after execute <source /etc/environment>"
    	;;
  		'Darwin') 
    	OS='Mac'
    	;;
  		*) ;;
	esac
}

oracle() {
    echo "Choose JDK version:"
    echo "*Oracle JDK 7 - 1"
    echo "*Oracle JDK 8 - 2"
    echo "*Oracle JDK 9 - 3"
    read -r result
    case $result in
    	"1")
		JAVA_VERSION=7 
		sudo apt-get update
		sudo add-apt-repository ppa:webupd8team/java
		sudo apt-get update

		sudo apt-get install -y oracle-java7-installer
		set_java_home_enviroment_variable
		;;

		"2")
		JAVA_VERSION=8
		sudo apt-get update
		sudo add-apt-repository ppa:webupd8team/java
		sudo apt-get update

		sudo apt-get install -y oracle-java8-installer
		set_java_home_enviroment_variable
		;;

		"3")
		JAVA_VERSION=9
		sudo apt-get update
		sudo add-apt-repository ppa:webupd8team/java
		sudo apt-get update

		sudo apt-get install -y oracle-java9-installer
		set_java_home_enviroment_variable
		;;
	esac

}

echo "Choose installation:"
echo "*Default JRE/JDK - 1"
echo "*Oracle JDK      - 2"
read -r result
case $result in
	"1" )
		default
	;;
	"2")
		oracle
	;;
esac

