#!/bin/bash

set -e

echo "Stopping Spring Boot application..."

# bookapp 프로세스 종료
if pgrep -f "bookapp-0.0.1-SNAPSHOT.jar" > /dev/null; then
    echo "Killing application process..."
    pkill -f "bookapp-0.0.1-SNAPSHOT.jar" || true
    sleep 2
    
    # 강제 종료 필요시
    pkill -9 -f "bookapp-0.0.1-SNAPSHOT.jar" || true
fi

echo "Application stopped successfully"
