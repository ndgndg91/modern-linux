# 의사 파일시스템
- VFS 를 통해 통일된 인터페이스르 제공한다.
- VFS 구현자가 블록 디바이스가 아닌 경우 인터페이스를 어떻게 제공하는가?
- 의사 파일시스템은 파일시스템인 것처럼 가장하여 일반적인 방식(`ls`, `cd`, `cat`)으로 상호 작용할 수 있는데, 실제로는 커널 인터페이스를 래핑한 것이다.
  - 프로세스에 대한 정보
  - 키보드 같은 디바이스와의 상호 작용
  - 데이터 소스나 싱크로 사용할 수 있는 특수 디바이스 같은 유틸리티

## procfs
- 리눅스는 유닉스로부터 파일시스템(procfs)을 물려받았다. 의도는 커널에서 프로세스 관련 정보를 발행하여 `ps` 나 `free` 같은 시스템 명령을 사용할 수 있게 하는 것이다. 구조에 대한 규칙이 거의 없고 읽기-쓰기 접근이 허용되며 시간이 지나면서 많은 정보가 procfs에 편입됐다.
  - /proc/PID/ 의 프로세스별 정보, 커널이 디렉터리를 통해 제공하는 프로세스 관련 정보로, PID 를 디렉터리 이름으로 사용.
  - 마운트, 네트워크 관련 정보, TTY 드라이버, 메모리 정보, 시스템 버전, 가동 시간과 같은 기타 정보
- procfs의 프로세스별 정보(가장 중요한 것만)
<table>
<tr>
<td>항목</td>
<td>유형</td>
<td>정보</td>
</tr>

<tr>
<td>attr</td>
<td>디렉터리</td>
<td>보안 속성</td>
</tr>
<tr>
<td>cgroup</td>
<td>파일</td>
<td>제어 그룹</td>
</tr>
<tr>
<td>cmdline</td>
<td>파일</td>
<td>커맨드라인</td>
</tr>
<tr>
<td>cwd</td>
<td>링크</td>
<td>현재 작업 디렉터리</td>
</tr>
<tr>
<td>environ</td>
<td>파일</td>
<td>환경변수</td>
</tr>
<tr>
<td>exe</td>
<td>링크</td>
<td>프로세스 실행 파일</td>
</tr>
<tr>
<td>fd</td>
<td>디렉터리</td>
<td>파일 디스크립터</td>
</tr>
<tr>
<td>io</td>
<td>파일</td>
<td>스토리지 I/O(바이트/문자 읽기 쓰기)</td>
</tr>
<tr>
<td>limits</td>
<td>파일</td>
<td>리소스 한계</td>
</tr>
<tr>
<td>mem</td>
<td>파일</td>
<td>사용된 메모리</td>
</tr>
<tr>
<td>mounts</td>
<td>파일</td>
<td>사용된 마운트</td>
</tr>
<tr>
<td>net</td>
<td>디렉터리</td>
<td>네트워크 통계</td>
</tr>
<tr>
<td>stat</td>
<td>파일</td>
<td>프로세스 상태</td>
</tr><tr>
<td>syscall</td>
<td>파일</td>
<td>시스템 콜 사용량</td>
</tr><tr>
<td>task</td>
<td>디렉터리</td>
<td>작업별(스레드별)정보</td>
</tr>
<tr>
<td>timers</td>
<td>파일</td>
<td>타이머 정보</td>
</tr>
<tr>
<td>fd</td>
<td>유형</td>
<td>정보</td>
</tr>
</table>

## sysfs
- procfs 가 꽤 거친 반면, sysfs 은 커널이 표준화된 레이아웃을 사용하여 선택한 정보를 노출하는 리눅스 고유의 구조화된 방법이다.

### block/
- 이 디렉터리는 발견된 블록 디바이스의 심볼릭 링크
### bus/
- 이 디렉터리는 커널에서 지원하는 각 물리 버스 유형마다 한 개씩 하위 디렉터리 존재
### class/
- 이 디렉터리는 디바이스 클래스가 포함
### dev/
- 이 디렉터리에는 블록 디바이스용 block/ 과 시스템의 문자 디바이스용 char/ 를 하위로 포함하고 있다.
### devices/
- 커널은 디바이스를 트리 형태로 표현한 정보를 제공
### firmware/
- 이 디렉터리를 통해 펌웨어 관련 속성을 관리 가능
### fs/
- 이 디렉터리는 일부 파일시스템의 하위 디렉터리가 포함
### module/
- 이 디렉터리에서 커널에 로드된 각 모듈의 하위 디렉터리를 찾을 수 있음

## devfs
- devfs 는 물리적 디바이스에서부터 난수 생성기나 쓰기 전용 데이터 싱크에 이르기까지 모든 디바이스를 나타내는 디바이스 특수 파일을 호스팅한다.

### 블록 디바이스
- 저장 디바이스 같은 블록의 데이터 처리
### 문자 디바이스
- 터미널, 키보드, 마우스 같은 디바이스를 문자 단위로 처리
### 특수 디바이스
- 데이터를 생성하거나 조작할 수 있다. /dev/null 이나 /dev/random 도 여기 포함

/dev/urandom 은 파일처럼 보이고 파일처럼 사용할 수 있지만 실제로는 여러 데이터 소스를 사용하여 무작위 출력을 생성하는 특수 파일
```
giri ~ %head -c50 < /dev/urandom | base64
VwTv63JpasK0fmBYUNk2tqURJv1K/pOaTGG3HcIikzNkRJw3GDOOuJ+9VfSSaCntCGg=
```

