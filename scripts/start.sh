#!/bin/bash
cd /home/ec2-user/app
JAR=$(ls *.jar | grep -v original | head -n1)   # backend-app.jar 자동 선택
nohup java -jar "$JAR" --server.port=8080 > /home/ec2-user/app/app.log 2>&1 &