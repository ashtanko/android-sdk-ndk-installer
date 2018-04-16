#! /usr/bin/env bash

installsdk() {
	wget https://dl.google.com/android/archives/android-sdk-linux_x86-1.6_r1.tgz
	sudo mkdir /opt/android/
	sudo mv android-sdk-linux_x86-1.6_r1.tgz /opt/android
	cd /opt/android/
	sudo tar -xvf android-sdk-linux_x86-1.6_r1.tgz
	sudo rm -rf android-sdk-linux_x86-1.6_r1.tgz
	sudo chmod 755 android-sdk-linux_x86-1.6_r1
	sudo mv android-sdk-linux_x86-1.6_r1/* ./sdk
	sudo rm -rf android-sdk-linux_x86-1.6_r1
}

set_android_home_enviroment_variable() {
	echo "Setting the ANDROID_HOME Environment Variable"
	echo "Please set <ANDROID_HOME="/opt/android/sdk"> to /etc/environment"
   	echo "after execute <source /etc/environment>"
}

if which adb >/dev/null; then
	echo "android sdk detected"
else 
	echo "android sdk not found"
	echo "Do you want to install android sdk y/n?"
	read -r result
	case $result in
		"y" | "Y" | "yes")
			installsdk
			set_android_home_enviroment_variable
		;;

		"n" | "N")
		;;

		*)
		;;
	esac
fi