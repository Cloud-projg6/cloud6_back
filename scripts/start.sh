#!/bin/bash

# 1. 프로젝트 폴더 이동
cd /home/ec2-user/book-server

# 2. 기존 프로세스 종료
fuser -k 8080/tcp || true

# 3. 백그라운드 실행
# jar 파일명이 정확한지 확인하세요! (target 폴더 안에 있는지)
nohup java -jar target/bookapp-0.0.1-SNAPSHOT.jar > app.log 2>&1 &

# 4. Nginx 재시작 (프론트엔드 통신용)
sudo systemctl restart nginx