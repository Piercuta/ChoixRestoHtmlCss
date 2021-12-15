#!/bin/bash
cd /var/www/
Env=$(cat env.txt)
ApplicationName=$(cat application_name.txt)
DllToStart=$(cat dll_to_start.txt)
echo "stop application"
cd  /var/www/${ApplicationName:1:-1}/
echo "kill $(ps aux | grep $DllToStart | awk '{print $2}')"
kill $(ps aux | grep $DllToStart | awk '{print $2}') || echo "Process $DllToStart was not running."