#!/bin/bash
echo "새 애플리케이션 배포 및 실행..."

# 1. 💡 [자동화 추가] EC2 서버에 Java 17이 있는지 확인하고, 없으면 자동으로 설치합니다.
if ! type java > /dev/null 2>&1 || ! java -version 2>&1 | grep -q "17"; then
    echo "Java 17이 설치되어 있지 않습니다. 자동으로 설치를 진행합니다..."
    sudo dnf install -y java-17-amazon-corretto-devel
    echo "Java 17 설치 완료!"
else
    echo "Java 17이 이미 설치되어 있어 설치를 건너뜁니다."
fi

# 2. 혹시 기존에 8080 포트를 쓰고 있는 자바가 있다면 배포 직전에 안전하게 종료
sudo fuser -k 8080/tcp || true

# 3. 실제 jar 파일이 존재하는 target 폴더로 이동
cd /home/ec2-user/app/target

# 4. 권한 에러 방지: app 폴더 전체의 소유권을 ec2-user에게 강제로 부여
sudo chown -R ec2-user:ec2-user /home/ec2-user/app

# 5. 빌드 단계에서 주입된 환경변수 파일(env.sh)을 로드
if [ -f ../scripts/env.sh ]; then
    source ../scripts/env.sh
    echo "환경변수(JWT_SECRET) 로드 완료."
else
    export JWT_SECRET="v9B2A7XmK4qZ8wP1eR5tY3uI6oO0pL9nB8vC7xZ6mK5qJ4wE3rT2yU1iO0pL9K8"
    echo "경고: env.sh 파일을 찾을 수 없어 내장된 기본 secret을 준비합니다."
fi

# 6. 스프링 부트 실행 시 구동 매개변수로 jwt.secret을 직접 주입
nohup java -jar *.jar --jwt.secret=${JWT_SECRET} > nohup.out 2>&1 &

echo "애플리케이션 실행 완료!"