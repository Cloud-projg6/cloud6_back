#!/bin/bash

echo "Validating Spring Boot app..."

for i in {1..10}
do
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/health || true)

  if [ "$STATUS" = "200" ]; then
    echo "Application is healthy"
    exit 0
  fi

  echo "Waiting for app... attempt $i"
  sleep 5
done

echo "Application health check failed"
exit 1