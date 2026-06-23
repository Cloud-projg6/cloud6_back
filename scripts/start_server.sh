#!/bin/bash
echo "새 애플리케이션 배포 및 실행..."
cd /home/ubuntu/app
# 타겟 폴더 내의 jar 파일을 백그라운드로 실행하고 로그를 저장합니다.
nohup java -jar target/*.jar > nohup.out 2>&1 &
echo "애플리케이션 실행 완료!"