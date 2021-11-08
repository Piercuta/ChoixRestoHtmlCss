#!/bin/bash
cd /var/www/
Env=$(cat env.txt)
ApplicationName=$(aws ssm get-parameters --region eu-west-1 --names $Env-application-name --with-decryption --query Parameters[0].Value)
DllToStart=$(aws ssm get-parameters --region eu-west-1 --names $Env-dll-to-start --with-decryption --query Parameters[0].Value)
Dll=${DllToStart:1:-1} 
echo "stop application"
cd  /var/www/${ApplicationName:1:-1}/
echo "kill $(ps aux | grep $Dll | awk '{print $2}')"
kill $(ps aux | grep $Dll | awk '{print $2}') || echo "Process $Dll was not running."