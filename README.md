# **나만의 개발 작업실: Docker를 이용한 표준 개발 환경 구축 프로젝트**
#### CLI 기초부터 Docker 기반 웹 서버 운영 및 Git 버전 관리까지
---

## 1) 실행 환경
- **OS**: macOS Sequoia 15.7.4
- **Shell**: zsh
- **Docker**: 28.5.2 (OrbStack)
- **Git**: 2.53.0


## 2) 수행 체크리스트
- [x] 터미널 기본 명령어 익히기 및 작업 폴더 구성
- [x] chmod를 활용한 접근 권한 관리
- [x] Docker 설치 및 실행 환경 정상 작동 확인
- [x] hello-world 컨테이너 실행 테스트
- [x] 커스텀 Dockerfile 작성 및 이미지 빌드하기
- [x] 포트 매핑 설정을 통한 웹 서버 접속 확인
- [x] 바인드 마운트(Bind Mount)를 이용한 파일 공유
- [x] Docker Volume을 활용한 데이터 보존 실습
- [x] Git 저장소 생성 및 GitHub 원격 저장소 연결


## 3) 검증 방법 및 결과

###  ① 작업 디렉토리 위치 확인

- 명령어 : **% pwd**
- 결과 : /Users/son1732321732/Developer/my-docker2

###  ② 프로젝트 파일 구성 확인

- 명령어 : **% ls -al**
- 결과 : drwxr-xr-x   7 son1732321732  son1732321732   224  8  1 13:09 .
drwxr-xr-x   3 son1732321732  son1732321732    96  8  1 13:09 ..
drwxr-xr-x  13 son1732321732  son1732321732   416  8  1 18:13 .git
-rw-r--r--   1 son1732321732  son1732321732   292  8  1 13:09 docker-compose.yml
-rw-r--r--   1 son1732321732  son1732321732   521  8  1 13:09 Dockerfile
-rw-r--r--   1 son1732321732  son1732321732   408  8  1 14:54 index.html
-rw-r--r--   1 son1732321732  son1732321732  2588  8  1 18:50 README.md
- 실행화면 : ![실행화면](./images/ls_result.png)
https://github.com/jin1732/my-docker2/commit/6e1e122913868d95e088e497f727b080b3b020f4

###  ③ Git 커밋 이력 확인 (증거 링크와 매칭)
- 명령어 : **% git log --oneline -n 3**
- 결과 : 6e1e122 (HEAD -> main, origin/main, origin/HEAD) docs: add execution result image to READM
0ccfeef README la -al수정
cb39a43 README la -al 수정
- 실행화면 : ![실행화면](./images/log_result.png)
https://github.com/jin1732/my-docker2/commit/3ba0d9d54d37a59cd12bd05e6b1f574056509745

###  ④ Docker 컨테이너 실행 상태 확인
- 명령어 : **% docker-compose ps**
- 결과 : NAME                      IMAGE     COMMAND                   SERVICE      CREATED       STATUS       PORTS
my-docker2-web-server-1   nginx     "/docker-entrypoint.…"   web-server   6 hours ago   Up 6 hours   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp
- 실행화면 : ![실행화면](./images/compose_result.png)
https://github.com/jin1732/my-docker2/commit/f600478a7c0c28d83133bb75fe3b12e19cc81794

###  ⑤ 웹 서버 응답 확인
- 명령어 : **% curl localhost:8080**
- 결과 : <!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>☀︎ 나의 도커서버 만들기 ☀︎</title>
    <style>
        body { font-family: sans-serif; text-align: center; margin-top: 50px; }
        h1 { color: #0969da; }
    </style>
</head>
<body>
    <h1>Docker로 만든 Nginx 서버 작동</h1>
    <p>✨성공적으로 웹 서버를 띄웠어요~ ✨</p>
</body>
</html>  

- 실행화면 : ![실행화면](./images/curl_result.png)
https://github.com/jin1732/my-docker2/commit/099f61a979f3f879c2fab0278768a0cc3c6f61e0


## 4) 실습 기반 트러블슈팅 리포트

### [Case 1] 원격 브랜치 인식 불가
#### ① 문제 상황 (Problem)
- 상황: GitHub 웹 UI에서 test-fix2 브랜치를 새로 생성함.
- 에러: 로컬 터미널에서 해당 브랜치로 이동하기 위해 git checkout test-fix2를 입력했으나 에러 발생.
- 에러 메시지: error: pathspec 'test-fix2' did not match any file(s) known to git

### 2단계 : 문제 상황 
- git branch (결과 : * main)
- git checkout test-fix2 (결과 : error: pathspec 'test-fix2' did not match any file(s) known to git)
- **GitHub 웹에서 수정했던 README.md의 최신 내용이 로컬 파일에 반영되어 있지 않아서 에러.**
