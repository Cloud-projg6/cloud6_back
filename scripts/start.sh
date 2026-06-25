#!/bin/bash
cd /home/ec2-user/app
JAR=$(find . -maxdepth 2 -name "*.jar" | grep -v original | head -n1)
nohup java -jar "$JAR" --server.port=8080 > /home/ec2-user/app/app.log 2>&1 &
exit 0     # ← 명시적으로 즉시 종료