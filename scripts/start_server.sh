#!/bin/bash
echo "새 애플리케이션 배포 및 실행..."

# Amazon Linux 경로로 이동
cd /home/ec2-user/app

# 복사된 jar 파일을 바로 백그라운드로 실행하고 로그를 저장합니다.
nohup java -jar *.jar > nohup.out 2>&1 &

echo "애플리케이션 실행 완료!"