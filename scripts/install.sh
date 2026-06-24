#!/bin/bash
# 빌드 산출물 jar를 고정 이름으로 정리
JAR=$(ls /home/ec2-user/app/build/libs/*.jar | grep -v plain | head -n1)
cp "$JAR" /home/ec2-user/app/app.jar