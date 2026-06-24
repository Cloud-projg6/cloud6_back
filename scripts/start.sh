#!/bin/bash
echo "Start Spring Boot application"
cd /home/ec2-user/app/target
nohup java -jar bookapp-0.0.1-SNAPSHOT.jar > /home/ec2-user/app/app.log 2>&1 < /dev/null &
