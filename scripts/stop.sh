#!/bin/bash

APP_DIR="/home/ec2-user/app"
PID_FILE="$APP_DIR/app.pid"

echo "Stopping existing Spring Boot app..."

if [ -f "$PID_FILE" ]; then
  PID=$(cat "$PID_FILE")
  if ps -p "$PID" > /dev/null 2>&1; then
    kill "$PID"
    sleep 5
  fi
  rm -f "$PID_FILE"
fi

pkill -f "backend-app.jar" || true
exit 0