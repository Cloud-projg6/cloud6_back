#!/bin/bash
for i in $(seq 1 10); do
  code=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/ || echo 000)
  if [[ "$code" =~ ^(2|3|4)[0-9][0-9]$ ]]; then exit 0; fi   # 2xx,3xx,4xx면 앱 살아있음
  sleep 3
done
echo "app not healthy"; exit 1