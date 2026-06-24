#!/bin/bash

APP_DIR="/home/ec2-user/app"
JAR_FILE="$APP_DIR/backend-app.jar"

echo "Starting Spring Boot app..."

mkdir -p "$APP_DIR"

nohup java -jar "$JAR_FILE" \
  --server.port=8080 \
  > "$APP_DIR/app.log" 2>&1 &

echo $! > "$APP_DIR/app.pid"

sleep 10
exit 0