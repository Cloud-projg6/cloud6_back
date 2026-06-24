#!/bin/bash

# 1. 프로젝트 폴더 이동
cd /home/ec2-user/book-server

# 2. 기존 프로세스 종료 (8080 포트)
fuser -k 8080/tcp || true

# 3. 백그라운드 실행 (로그는 app.log에 기록)
nohup java -jar target/bookapp-0.0.1-SNAPSHOT.jar > app.log 2>&1 &