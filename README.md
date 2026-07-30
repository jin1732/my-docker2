# Docker를 활용한 Nginx 커스텀 웹 서버 구축 학습

## 1) 실행 환경
- **OS**: macOS Sequoia 15.7.4
- **Shell**: zsh
- **Docker**: 28.5.2 (OrbStack)
- **Git**: 2.53.0

## 2) 수행 체크리스트 (업데이트)
- [x] 터미널 워크플로우 및 폴더/파일 작동
- [x] chmod를 활용한 접근 권한 관리
- [x] Docker 설치/점검
- [x] hello-world 실행
- [x] Dockerfile 빌드/실행 (커스텀 이미지 제작)
- [x] 포트 매핑 접속 (8080:80)
- [x] 바인드 마운트 반영 (index.html 수정)
- [x] Git 설정 + VSCode GitHub 연동

### 3. Docker 설치 및 커스텀 이미지 빌드
# Docker 설치 확인
% docker version

# hello-world 컨테이너 실행 테스트
% docker run hello-world

# Dockerfile 작성 (Nginx 베이스의 커스텀 이미지)
# - LABEL: 관리자 정보 추가
# - COPY: 로컬의 index.html을 이미지 내부로 복사
# - EXPOSE: 80번 포트 개방

# 커스텀 이미지 빌드
% docker build -t my-custom-nginx:v1 .

# 컨테이너 실행 (포트 8080 연결)
% docker run -d -p 8080:80 --name my-web-server my-custom-nginx:v1

### 4. 커스텀 이미지의 의미
이번 실습에서 만든 이미지가 왜 '커스텀'인지 정리합니다.
1. **정체성 부여**: `LABEL`을 통해 제작자(jin1732) 정보를 메타데이터로 포함했습니다.
2. **콘텐츠 변경**: 기본 Nginx 초기 화면 대신, 직접 작성한 `index.html`을 이미지 안에 영구적으로 포함(`COPY`)시켰습니다.
3. **설계 명시**: `EXPOSE`를 통해 이 이미지가 어떤 포트를 사용하는지 가이드를 포함했습니다.

## 4) 학습 회고
- **Docker의 핵심**: 단순히 프로그램을 실행하는 것을 넘어, 내가 원하는 설정과 파일을 포함한 '나만의 환경'을 이미지로 캡슐화하는 과정을 익혔습니다.
- **인프라의 코드화**: Dockerfile이라는 텍스트 파일을 통해 서버 환경을 정의하고, 이를 Git으로 관리함으로써 개발 환경의 일관성을 유지하는 법을 배웠습니다.
- **권한 관리**: `chmod`를 통해 리눅스 기반 시스템에서의 파일 보안 권한을 실습하며 Docker 컨테이너 내부의 파일 시스템 구조를 이해하는 기초를 다졌습니다.