#!/bin/bash
echo "Start Spring Boot application"
cd /home/ubuntu/app
nohup java -jar target/bookapp-0.0.1-SNAPSHOT.jar > /home/ubuntu/app/app.log 2>&1 &
