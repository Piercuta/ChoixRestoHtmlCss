#!/bin/bash
# to remove once you set bash_profile correctly
export DOTNET_ROOT=/tmp/dotnet
export PATH=$PATH:$DOTNET_ROOT
# end to remove
cd /var/www/
Env=$(cat env.txt)
ApplicationName=$(cat application_name.txt)
DllToStart=$(cat dll_to_start.txt)
# ApplicationName=$(aws ssm get-parameters --region eu-west-1 --names $Env-$AppName --with-decryption --query Parameters[0].Value)
# DllToStart=$(aws ssm get-parameters --region eu-west-1 --names $Env-$AppName-dll-to-start --with-decryption --query Parameters[0].Value)
echo ${Env}
echo ${ApplicationName}
echo ${DllToStart} 
# we remove first and last quote get with ssm
sudo cp -R /var/www/my-temp-dir/* /var/www/${ApplicationName}
echo "start application"
cd /var/www/${ApplicationName}/
echo "dotnet ${DllToStart} > /dev/null 2>&1 &"
dotnet ${DllToStart} > /dev/null 2>&1 &
cd  /var/www/my-temp-dir/
rm -rf *