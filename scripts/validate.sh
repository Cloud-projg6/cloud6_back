#!/bin/bash
sleep 10
curl -fsS http://localhost:8080/ >/dev/null && exit 0 || exit 1