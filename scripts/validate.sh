#!/bin/bash
for i in $(seq 1 30); do
  code=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/ || echo 000)
  if [[ "$code" =~ ^(2|3)[0-9][0-9]$ || "$code" == "404" ]]; then exit 0; fi
  sleep 5
done
echo "app not healthy"; exit 1