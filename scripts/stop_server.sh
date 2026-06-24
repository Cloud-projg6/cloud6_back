#!/bin/bash
echo "기존 Spring Boot 애플리케이션 종료 중..."

# 프로세스가 없어도 에러를 내지 않도록 || true를 붙여줍니다.
CURRENT_PID=$(pgrep -f java || true)

# 만약 문자열이 완전히 비어있거나 공백만 있다면 처리
if [ -z "${CURRENT_PID}" ]; then
    echo "구동 중인 애플리케이션이 없습니다."
else
    echo "PID: $CURRENT_PID 종료"
    kill -15 $CURRENT_PID
    sleep 5
fi

# AMI 생성 시 같이 구워져 나온 기존 JAR 파일 및 폴더 찌꺼기 완벽 청소
echo "기존 배포 파일 및 target 폴더 찌꺼기 제거 중..."
sudo rm -rf /home/ec2-user/app/target/*

# CodeDeploy에게 이 스크립트가 무사히 끝났음을 강제로 알립니다.
exit 0