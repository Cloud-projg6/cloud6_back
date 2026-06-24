#!/bin/bash
echo "Stop Spring Boot application"

# 8080 포트를 점유 중인 PID 조회 (절대 경로 사용)
PID=$(/usr/sbin/lsof -t -i:8080)

if [ -z "$PID" ]; then
    echo "No application running on port 8080."
else
    echo "Killing process $PID"
    kill -15 $PID
    sleep 5
fi
