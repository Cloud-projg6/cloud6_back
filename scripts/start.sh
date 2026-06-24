#!/bin/bash
echo "Start Spring Boot application"
cd /home/ec2-user/app
nohup java -jar target/bookapp-0.0.1-SNAPSHOT.jar > /home/ec2-user/app/app.log 2>&1 &
