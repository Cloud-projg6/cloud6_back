#!/bin/bash

set -e

echo "Starting Spring Boot application..."

# JAR 파일 경로
JAR_FILE="/opt/bookapp/backend/bookapp-0.0.1-SNAPSHOT.jar"

# 기존 프로세스 확인 및 종료
if pgrep -f "bookapp-0.0.1-SNAPSHOT.jar" > /dev/null; then
    echo "Stopping existing application..."
    pkill -f "bookapp-0.0.1-SNAPSHOT.jar" || true
    sleep 2
fi

# 환경 변수 설정
export JAVA_HOME=/usr/lib/jvm/java-17-amazon-corretto
export PATH=$JAVA_HOME/bin:$PATH

# Spring Boot 애플리케이션 시작
nohup java -jar $JAR_FILE > /opt/bookapp/backend/app.log 2>&1 &

echo "Application started successfully"
sleep 5

# 프로세스 확인
if pgrep -f "bookapp-0.0.1-SNAPSHOT.jar" > /dev/null; then
    echo "Application is running"
else
    echo "Application failed to start"
    cat /opt/bookapp/backend/app.log
    exit 1
fi
