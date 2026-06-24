#!/bin/bash
JAR_FILE=$(ls /home/ec2-user/app/target/*.jar | head -1)
nohup java -jar $JAR_FILE \
  --spring.config.additional-location=/home/ec2-user/app/config/ \
  > /home/ec2-user/app/app.log 2>&1 &