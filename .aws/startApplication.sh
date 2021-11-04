#!/bin/bash
ApplicationName=$(aws ssm get-parameters --region eu-west-1 --names ApplicationName --with-decryption --query Parameters[0].Value)
echo "${ApplicationName}"
# we remove first and last quote get with ssm
sudo cp -R /var/www/my-temp-dir/* /var/www/${ApplicationName:1:-1}
echo "start application"
cd /var/www/${ApplicationName:1:-1}/
echo "dotnet ChoixResto.dll > /dev/null 2>&1 &"
dotnet ChoixResto.dll > /dev/null 2>&1 &
cd  /var/www/my-temp-dir/
rm -rf *

