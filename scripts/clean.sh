#!/bin/bash
echo "Cleaning previous deployment files"
rm -f /home/ec2-user/app/target/*.jar
rm -f /home/ec2-user/app/*.jar
exit 0