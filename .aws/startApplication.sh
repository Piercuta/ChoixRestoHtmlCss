#!/bin/bash
cd /etc/profile.d/
./load_env.sh
cp -R /var/www/my-temp-dir /var/www/${ApplicationName}
echo "start application"
cd /var/www/${ApplicationName}/
echo "dotnet ChoixResto.dll > /dev/null 2>&1 &"
dotnet ChoixResto.dll > /dev/null 2>&1 &


