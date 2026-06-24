#!/bin/bash
echo "새 애플리케이션 배포 및 실행..."
# 1. 혹시 기존에 8080 포트를 쓰고 있는 자바가 있다면 배포 직전에 안전하게 종료
sudo fuser -k 8080/tcp || true

# 실제 jar 파일이 존재하는 target 폴더로 이동
cd /home/ec2-user/app/target

# 빌드 단계에서 주입된 환경변수 파일(env.sh)을 로드
if [ -f scripts/env.sh ]; then
    source scripts/env.sh
    echo "환경변수(JWT_SECRET) 로드 완료."
else
    # 에러 해결하면 export~ 라인은 삭제하기
    export JWT_SECRET="v9B2A7XmK4qZ8wP1eR5tY3uI6oO0pL9nB8vC7xZ6mK5qJ4wE3rT2yU1iO0pL9K8"
    echo "경고: scripts/env.sh 파일을 찾을 수 없습니다. 환경변수 없이 실행을 시도합니다."
fi

# 복사된 jar 파일을 바로 백그라운드로 실행하고 로그를 저장합니다.
nohup java -jar *.jar > nohup.out 2>&1 &

echo "애플리케이션 실행 완료!"