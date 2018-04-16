#! /usr/bin/env bash

#Checking java installation
if which java >/dev/null; then
	echo "java detected in $(which java) and version $(java -version)"
	sh install-android-sdk.sh
else
	echo "java not installed"
	echo "Do you want to install java y/n?"
	read -r result
	case $result in
		"y" | "Y" | "yes" | "Yes" | "YES" | "yeah")
			sh install-java.sh
		;;
		"n" | "N" | "no" | "No" | "NO" | "nope")
			exit 1;
		;;
		*)
		echo "please correct your input"
		;;
	esac
fi

