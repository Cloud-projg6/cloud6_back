#!/bin/bash
echo "새 애플리케이션 배포 및 실행..."

# Amazon Linux 경로로 이동
cd /home/ec2-user/app

# 빌드 단계에서 주입된 환경변수 파일(env.sh)을 로드
if [ -f scripts/env.sh ]; then
    source scripts/env.sh
    echo "환경변수(JWT_SECRET) 로드 완료."
else
    echo "경고: scripts/env.sh 파일을 찾을 수 없습니다. 환경변수 없이 실행을 시도합니다."
fi

# 복사된 jar 파일을 바로 백그라운드로 실행하고 로그를 저장합니다.
nohup java -jar *.jar > nohup.out 2>&1 &

echo "애플리케이션 실행 완료!"