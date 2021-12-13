#!/bin/bash
cd /var/www/
Env=$(cat env.txt)
AppName=$(cat application_name.txt)
ApplicationName=$(aws ssm get-parameters --region eu-west-1 --names $Env-$AppName --with-decryption --query Parameters[0].Value)
DllToStart=$(aws ssm get-parameters --region eu-west-1 --names $Env-$AppName-dll-to-start --with-decryption --query Parameters[0].Value)
echo ${ApplicationName}
echo ${DllToStart} 
# we remove first and last quote get with ssm
sudo cp -R /var/www/my-temp-dir/* /var/www/${ApplicationName:1:-1}
echo "start application"
cd /var/www/${ApplicationName:1:-1}/
echo "dotnet ${DllToStart:1:-1} > /dev/null 2>&1 &"
dotnet ${DllToStart:1:-1} > /dev/null 2>&1 &
cd  /var/www/my-temp-dir/
rm -rf *