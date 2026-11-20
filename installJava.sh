
#! /bin/bash

echo "The Script installs the latest java version if none found."

echo "Checking available java installation..."

if  command -v java &> /dev/null;
    then
        java_version=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}' | awk -F '.' '{print ($1 == "1" ? $2 : $1)}')
        java_location=$(command -v java)
        java_compiler_location=$(command -v javac)
	echo "A java ${java_version} is already installed at ${java_location}"
else 
	echo "No Java Installation Found installing the Lastest Version"
	echo "Enter password if Prompted to."
	sudo apt update
	sudo apt install default-jdk

	echo "Installation was successfull"
	java_version=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}' | awk -F '.' '{print ($1 == "1" ? $2 : $1)}')
	if ${java_version} < 11; 
		then
		 echo "An older version of Java Was installed ${java_version}"
	echo "A newer version 11 ^ was installed: Java-${java_version}" 
	fi
fi





