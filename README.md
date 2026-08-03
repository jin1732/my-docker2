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



## 3) Docker & Git 개발 환경 구축 전체 로드맵

###  ① 프로젝트 기초 공사
- mkdir my-docker : 프로젝트 폴더 생성 (내 작업실 만들기)
- cd my-docker : 폴더로 이동 (작업실 안으로 들어가기)
- git init : Git 저장소 시작 (이 폴더를 Git이 지금부터 감시하고 기록하기 시작함)
- git config --global user.name "이름" : 내 이름 등록 (누가 기록했는지 남기기 위해)
- git config --global user.email "이메일" : 내 이메일 등록 (연락처 정보 남기기)

###  ② 첫 기록 남기기
- touch README.md : 프로젝트 설명서 파일 생성
- git add README.md : Git에게 "이 파일을 다음 기록(커밋)에 포함할 거야"라고 말하기 (장바구니에 담기)
- git commit -m "첫 커밋" : 현재 상태를 사진 찍듯 기록하여 내 컴퓨터에 저장하기 (최종 구매 확정)

###  ③ Docker 엔진 가동 (중요!)
- OrbStack 실행: Docker 명령어를 쓰기 전 반드시 실행 (기계를 켜는 작업)
- docker run hello-world : Docker 기계가 잘 돌아가는지 테스트 (확인용)

###  ④ 본격적인 코딩 및 설계 (VS Code 활용)
- code . : VS Code로 현재 폴더 열기
- index.html 생성: 웹사이트의 내용을 작성 (예: Hello Docker!)
- Dockerfile 생성: "나만의 서버 이미지"를 만드는 레시피 작성 (Nginx 베이스, 파일 복사 설정)
- docker-compose.yml 생성: Docker 설계도 작성 (이미지, 포트 번호 등 정의)

###  ⑤ 서비스 실행 및 확인
- docker compose up -d --build : 설계도대로 서버를 조립하고 백그라운드에서 실행
- 브라우저 확인: 주소창에 localhost:8080을 입력해 내 웹사이트가 나오는지 확인

###  ⑥ 작업 마무리 (로컬 Git 기록)
- git add . : 새로 만든 모든 파일(html, Dockerfile 등)을 장바구니에 담기
- git commit -m "Nginx 설정 완료" : 오늘 작업한 내용을 내 컴퓨터 Git에 최종 저장

###  ⑦ GitHub에 내보내기 (원격 저장소 연동)
- git remote add origin [GitHub 주소] : 내 컴퓨터와 GitHub 저장소를 연결 (최초 1회)
- git push origin main : 내 컴퓨터의 기록을 GitHub로 전송 (클라우드 백업 및 공유)

###  ⑧ 서비스 관리 및 상태 점검
- docker ps : 현재 실행 중인 컨테이너 목록과 상태 확인 (건강검진)
- docker logs -f [컨테이너명] : 서버 내부의 로그(접속 기록, 에러)를 실시간으로 확인

###  ⑨ 코드 수정 및 업데이트 (반복 작업)
- 파일 수정: VS Code에서 내용을 수정하고 저장
- docker compose up -d --build : 수정한 코드를 서버에 반영하기 위해 다시 조립하고 실행
- 새로고침: 브라우저에서 변경된 내용 확인

###  ⑩ 환경 정리 및 리소스 관리
- docker compose down : 실행 중인 서비스를 완전히 끄고 삭제 (깔끔한 뒷정리)
- docker system prune -a : 사용하지 않는 이미지/컨테이너 찌꺼기를 삭제해 용량 확보

###  ⑪ 협업 및 동기화
- git status : 현재 수정된 파일이 무엇인지 수시로 체크
- git pull origin main : GitHub에 있는 최신 코드를 내 컴퓨터로 가져오기 (※ 내용이 반영되지 않는다면 13단계 Case 2 참고)
- .gitignore 작성: 보안상 중요한 파일이나 불필요한 파일이 Git에 올라가지 않도록 설정

###  ⑫ 나만의 이미지 배포 (심화)
- docker login : Docker Hub 계정으로 로그인
- docker push [내아이디]/이미지명 : 내가 만든 이미지를 인터넷에 올려서 어디서든 사용할 수 있게 만들기



## 4) 검증 방법 및 결과

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



## 5) 실습 기반 트러블슈팅 리포트

### [Case 1] 원격 브랜치 인식 불가

#### ① 문제 상황 (Problem)
- 상황: GitHub 웹 UI에서 test-fix2 브랜치를 새로 생성함.
- 로컬 터미널에서 해당 브랜치로 이동하기 위해 git checkout test-fix2를 입력했으나 에러 발생.
- 에러 메시지: error: pathspec 'test-fix2' did not match any file(s) known to git

#### ② 원인 가설
- 로컬 Git 저장소의 메타데이터(Metadata)가 서버(GitHub)의 최신 상태를 반영하지 못하고 있음.
- 로컬 저장소는 서버에 test-fix2라는 브랜치가 생겼다는 사실을 아직 인지하지 못한 상태임.

#### ③ 상태 확인
- git branch -a 명령어로 전체 브랜치 목록을 확인한 결과, 서버에는 존재하는 test-fix2가 로컬 목록에는 나타나지 않음을 확인.

#### ④ 해결 과정
- git fetch를 실행하여 서버의 최신 브랜치 정보를 로컬로 업데이트.
- 동기화 후 브랜치 목록에 test-fix2가 정상적으로 나타나며, 브랜치 이동(checkout)이 가능해짐.

### [Case 2] 로컬-원격 파일 내용 불일치 문제 

#### ① 문제 상황 (Problem)
- 상황: GitHub 웹 UI에서 test-fix2 README.md 파일을 직접 수정하고 커밋함.
- 현상 : 로컬에서 git checkout test-fix2로 이동은 했으나, 웹에서 수정했던 최신 문구가 파일에 보이지 않음.

#### ② 원인 가설
- 로컬에 브랜치 이름은 존재하지만, 서버에 새로 올라온 **'최신 커밋 데이터'**를 아직 다운로드하지 않았기 때문임.
즉, "브랜치의 존재(정보)"는 알지만 "실제 내용(데이터)"은 과거 상태에 머물러 있음.

#### ③ 상태 확인
- cat README.md 명령어로 파일 내용을 확인한 결과, 원격에서 추가한 문구가 없고 수정 전의 과거 텍스트만 확인됨.

#### ④ 해결 과정
- git pull origin test-fix2 명령어를 실행.
- 서버의 최신 커밋 데이터를 가져와서(fetch) 현재 로컬 파일에 합침(merge). 이후 cat README.md로 최신 내용이 반영된 것을 확인.

### 터미널 조작 로그
- GitHub에서 브랜치를 삭제한 후, `git fetch -p`를 통해 로컬의 원격 브랜치 목록을 동기화한 실제 로그입니다.
- 실행화면 ![실핼화면](./images/fetch_result.png)


