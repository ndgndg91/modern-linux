# systemd
- 처음에 initd 를 대체하는 init 시스템이었지만 최근에 로깅, 네트워크 구성, 네트워크 시간 동기화와 같은 기능을 포함하는 강력한 관리자.
- 페도라, openSUSE, CentOS, RHEL, SUSE linux, 데비안, 우분투를 포함해 현재 거의 모든 리눅스 배포판이 systemd 를 사용
  - 여러 배포판에서 리눅스의 시작을 관리할 수 있는 통일된 방법 제공
  - 빠르고 쉬운 서비스 구성 구현
  - 모니터링, cgroup 을 통한 리소스 사용제어, 내장된 audit 기능을 포함한 최신 관리 제품군 제공
- init 은 초기화 때 순서대로 서비스를 시작하는 반면, systemd 는 종속성만 충족되면 시작할 수 있어서 시작 시간을 단축할 수 있음.

## 유닛
- systemd 는 기능 및 대상 리소스에 따라 의미 체계를 다르게 가져가는 논리 그룹
### service 유닛
- 서비스나 어플리케이션 관리하는 방법 설명
### target 유닛
- 종속성 캡쳐
### mount 유닛
- 마운트 지점 정의
### timer 유닛
- 크론 작업 등에 대한 타이머 정의
### socket
- 네트워크나 IPC(Inter Process Communicate) 소켓을 설명
### device
- udev 나 sysfs 파일시스템용
### automount
- 자동 마운트 지점 구성
### swap
- 스왑 공간 설명
### path
- 경로 기반 활성화용
### snapshot
- 변경사항이 일어난 후 시스템의 현재 사아태를 재구성할 수 있음
### slice
- cgroup 과 연관
### scope
- 외부에서 생성된 시스템 프로세스 세트를 관리
### /lib/systemd/system
- 패키지가 설치한 유닛
### /etc/systemd/system
- 시스템 관리자가 구성한 유닛
### /run/systemd/system
- 비지속적 런타임 수정사항

## systemctl 로 관리하기
- systemd 와 상호 작용해 서비스를 관리하기 위해 사용하는 도구로 systemctl

종속성 관리와 쿼리, 전체 시스템 제어(예: 재부팅) 등 이외에도 많은 명령어 존재
```
systemctl enable XXXXX.service -> 서비스 활성화. 시작할 준비를 갖춤
systemctl daemon-reload -> 모든 유닛 파일을 다시 로드하고 전체 종속성 트리를 다시 생성함
systemctl start XXXXX.service -> 서비스 시작
systemctl stop XXXXX.service -> 서비스 정지
systemctl restart XXXXX.service -> 서비스 정지 후 새로 시작
systemctl reload XXXXX.servie -> 서비스에 reload 명령을 보냄. restart 로 돌아감
systemctl kill XXXXX.servie -> 서비스 실행 중지
systemctl status XXXXX.service -> 일부 로그를 포함해서 서비스 상태에 대한 간단 요약
```

### bootctl
- 부트로더 상태를 확인하고 사용 가능한 부트로더 관리
### timedatectl
- 시간과 날짜 관련 정보를 설정하고 볼 수 있다.
### coredumpctl
- 저장된 코어 덤프를 처리 가능.

## journalctl 로 모니터링하기
- 저널은 systemd 의 구성요소. systemd-journald 데몬이 관리하는 바이너리 파일로, systemd 구성요소가 기록하는 모든 메시지를 한곳에 모은것

## 예제: greeter 스케줄링
