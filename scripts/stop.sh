#!/bin/bash
echo "Stop Spring Boot application"
PID=$(pgrep -f 'bookapp-0.0.1-SNAPSHOT.jar')
if [ -z "$PID" ]; then
    echo "No application running."
else
    echo "Killing process $PID"
    kill -15 $PID
    sleep 5
fi
