#!/bin/bash
ApplicationName=$(aws ssm get-parameters --region eu-west-1 --names ApplicationName --with-decryption --query Parameters[0].Value)
echo "stop application"
cd  /var/www/${ApplicationName:1:-1}/
echo "kill $(ps aux | grep '[C]hoixResto.dll' | awk '{print $2}')"
kill $(ps aux | grep '[C]hoixResto.dll' | awk '{print $2}') || echo "Process ChoixResto.dll was not running."