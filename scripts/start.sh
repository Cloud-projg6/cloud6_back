#!/bin/bash

cd /home/ec2-user/app/target

JAR_FILE=$(ls *.jar | grep -v plain | head -n 1)

if [ -z "$JAR_FILE" ]; then
  echo "JAR file not found"
  exit 1
fi

nohup java -jar "$JAR_FILE" > /home/ec2-user/app/app.log 2>&1 &