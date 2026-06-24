#!/bin/bash
echo "Start Spring Boot application"

# JAR 파일이 있는 위치로 이동
cd /home/ec2-user/app/target

# ec2-user 권한으로 Java 절대 경로를 이용해 백그라운드 실행
nohup sudo -u ec2-user /usr/bin/java -jar bookapp-0.0.1-SNAPSHOT.jar > /home/ec2-user/app/app.log 2>&1 < /dev/null &

echo "Application deployment script finished"
