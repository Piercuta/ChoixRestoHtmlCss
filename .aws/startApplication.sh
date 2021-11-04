#!/bin/bash

echo "start application"
cd /var/www/my-application/site/
echo "dotnet ChoixResto.dll > /dev/null 2>&1 &"
dotnet ChoixResto.dll > /dev/null 2>&1 &


