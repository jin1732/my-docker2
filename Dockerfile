# 1. 어떤 기존 베이스를 선택했는가: NGINX 최신 버전
FROM nginx:latest

# 2. 커스텀 포인트 1: 이미지 관리자 정보 추가 (메타데이터)
LABEL maintainer="jin1732 <son173232@naver.com>"

# 3. 커스텀 포인트 2: 내가 만든 index.html을 이미지 내부로 복사
# (이 작업을 통해 볼륨 연결 없이도 이미지만 실행하면 내 웹사이트가 뜹니다.)
COPY index.html /usr/share/nginx/html/index.html

# 4. 커스텀 포인트 3: 80번 포트 개방 명시
EXPOSE 80