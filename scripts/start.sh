#!/bin/bash
# 1. 포트 8080을 사용 중인 프로세스를 찾아서 종료 (권한 때문에 sudo 필요)
sudo fuser -k 8080/tcp

# 2. 서비스 재시작
sudo systemctl restart bookapp

# 3. 기다림
sleep 5