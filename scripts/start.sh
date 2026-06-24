#!/bin/bash

# 1. 프로젝트 폴더로 이동
cd /home/ec2-user/book-server

# 2. 혹시 이미 실행 중인 프로세스가 있다면 종료 (포트 3000번 사용 가정)
# 만약 포트가 다르다면 3000을 본인의 포트 번호로 바꾸세요.
fuser -k 8080/tcp || true

# 3. 새로운 프로세스 실행
# 로그를 남기고 싶다면 > /dev/null 대신 파일명을 적으세요.
nohup npm start > app.log 2>&1 &