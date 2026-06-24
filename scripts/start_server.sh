#!/bin/bash
echo "새 애플리케이션 배포 및 실행..."

if ! type java > /dev/null 2>&1 || ! java -version 2>&1 | grep -q "17"; then
    echo "Java 17이 설치되어 있지 않습니다. 자동으로 설치를 진행합니다..."
    sudo dnf install -y java-17-amazon-corretto-devel
    echo "Java 17 설치 완료!"
else
    echo "Java 17이 이미 설치되어 있어 설치를 건너뜁니다."
fi

sudo fuser -k 8080/tcp || true
sleep 2

cd /home/ec2-user/app/target

if [ -f /home/ec2-user/app/scripts/env.sh ]; then
    source /home/ec2-user/app/scripts/env.sh
    echo "환경변수(JWT_SECRET) 절대 경로로 로드 완료."
else
    export JWT_SECRET="v9B2A7XmK4qZ8wP1eR5tY3uI6oO0pL9nB8vC7xZ6mK5qJ4wE3rT2yU1iO0pL9K8"
    echo "경고: env.sh 파일을 찾을 수 없어 스크립트 내장 secret을 준비합니다."
fi

sudo chown -R ec2-user:ec2-user /home/ec2-user/app

nohup /usr/bin/java -jar *.jar --jwt.secret=${JWT_SECRET} > /home/ec2-user/app/target/nohup.out 2>&1 < /dev/null &

echo "애플리케이션 실행 명령어 전달 완료!"