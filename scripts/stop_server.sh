#!/bin/bash
echo "기존 Spring Boot 애플리케이션 종료 중..."
CURRENT_PID=$(pgrep -f .jar)
if [ -z "$CURRENT_PID" ]; then
    echo "구동 중인 애플리케이션이 없습니다."
else
    echo "PID: $CURRENT_PID 종료"
    kill -15 $CURRENT_PID
    sleep 5
fi