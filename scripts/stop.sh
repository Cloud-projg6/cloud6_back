#!/bin/bash

PID=$(pgrep -f 'java -jar' || true)

if [ -n "$PID" ]; then
  echo "Stopping application: $PID"
  kill -15 $PID
  sleep 5
else
  echo "No running application"
fi