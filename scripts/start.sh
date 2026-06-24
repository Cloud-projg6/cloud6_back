#!/bin/bash
cd /home/ec2-user/app
nohup java -jar app.jar --server.port=8080 > /home/ec2-user/app/app.log 2>&1 &