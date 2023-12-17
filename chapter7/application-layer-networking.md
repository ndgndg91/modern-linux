# 애플리케이션 계층 네트워킹

## 웹
### URL
- Uniform Resource Locator 웹에서 리소스의 ID와 위치를 정의. 리소스는 정적 콘텐츠 혹은 동적으로 생성하는 프로세스 일 수도 있다.
```
ndgndg91:1234@http://exmaple.com:4242/this/is/the/way?orlist=really#anothor

user - ndgndg91
password - 1234
scheme - http
authority - example.com:4242
path - /this/is/the/way
query - ?orlist=really
fragment #another
```
- user 와 password(선택사항 and deprecated)
  - 처음에는 기본 인증에 사용, 지금은 더 이상 사용하면 안된다.
  - HTTPS 와 적절한 인증 메커니즘을 함께 사용해야 한다.
- scheme
- authority
  - 호스트네임
    - DNS FQDN 이나 IP 주소
  - 포트
    - 기본값 80
- path
  - scheme 관련이 있으며, 추가 리소스 세부사항 담는다.
- query 와 fragment(선택사항)
### HTTP
- Hypertext Transfer Protocol 은 애플리케이션 계층 프로토콜이며, URL 을 통해 사용 가능한 콘텐츠와 상호 작용하는 방법을 정의.
- v1.1, v2, v3 버전 존재
  - HTTP 메서드
    - GET, POST, PUT, PATCH, DELETE 등 CRUD
  - 리소스 네이밍
    - URL 구성
  - 상태코드
    - 2xx 성공
    - 3xx 재지정
    - 4xx 클라이언트 오류
    - 5xx 서버 오류
## 시큐어 셸(SSH)
- 보안이 취약한 네트워크에서 네트워크 서비스를 안전하게 제공하기 위한 암호화 네트워크 프로토콜
  - SSH 서버를 실행하고, 다른 사람이 자신의 시스템에 SSH 접속할 수 있게 허용하는 경우, 암호 인증을 비활성화 해야한다. 사용자가 키 쌍을 생성한 다음에 공개키를 공유하게 되며, 공개키를 ~/.ssh/authorized_keys 에 추가하여 키 메커니즘으로만 로그인하게끔 강제한다.
  - 클라이언트에 ssh 세션에 대한 타임아웃을 설정하자. ~/.ssh/config ㅇㅔ ServerAliveInteva, ServerAliveConutMax 옵션을 설정

## 파일 전송
- 로컬 -> 클라우드나 로컬 -> 다른 컴퓨터 
- 원격 시스템 간의 복사를 위해서는 scp(scure copy) 를 ssh 위에서 사용 가능.
  - copyme
  - rsync
  - aws s3 sync
- FTP 는 권장하지 않는다. 안전하지 않고, 대안이 많다. 실제로도 필요하지 않다.
## 네트워크 파일 시스템(NFS)
- 네트워크를 통해 중앙에서 파일을 공유하는 수단으로 널리 지원.
- AWS, Azure 등 많은 클라우드 공급사들이 NFS 서비스 제공.