#!/bin/bash
echo "기존 Spring Boot 애플리케이션 종료 중..."

sudo fuser -k 8080/tcp || true
sleep 3

echo "기존 배포 파일 및 target 폴더 찌꺼기 제거 중..."
sudo rm -rf /home/ec2-user/app/target/*

exit 0