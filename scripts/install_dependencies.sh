#!/bin/bash
echo "Installing Java 17..."
sudo yum install -y java-17-amazon-corretto lsof

echo "Cleaning up destination directory..."
sudo rm -rf /home/ec2-user/app/*
sudo rm -rf /home/ec2-user/app/.[!.]* || true
