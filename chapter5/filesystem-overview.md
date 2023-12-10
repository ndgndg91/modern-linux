# 개요
- 대부분의 파일시스템은 계층 구조. root(/)로 시작하는 단일 파일시스템 트리 제공
- 디렉터리와 파일이라는 유형의 객체로 구성. 디렉터리는 파일을 그룹화하는 조직의 단위. 디렉터리는 트리의 노드고 파일이나 디렉터리가 리프임
- 권한 내장
- 커널에서 구현

### 드라이브
- HDD(하드 디스크 드라이브), SSD(솔리드 스테이트 드라이브) 같은 블록 디바이스.
### 파티션
- 논리적으로 드라이브를 분할. ex) HDD /dev/sdb1, /dev/sdb2 로 표시
### 볼륨
- 파티션과 유사하지만 보다 유연./
### 슈퍼블록
- 파일시스템 시작 부분에 파일시스템의 메타데이터를 캡처하는 특수 섹션. 파일시스템의 유형, 블록, 상태, 블록당 아이노드 수 등이 포함.
### 아이노드
- 크기, 소유자, 위치, 날짜, 권한과 같은 파일의 메타데이터를 저장. 파일명과 실제 데이터는 저장하지 않음.

## 링크
### 하드 링크
- 아이노드를 참조하며 디렉터리는 참조 x.
### [심볼릭 링크](https://man7.org/linux/man-pages/man7/symlink.7.html)
- 파일의 내용이 다른 파이의 경로를 나타내는 문자열인 특수 파일
```
giri ~ %touch myfile
giri ~ %ln myfile myalias
giri ~ %ln -s myfile myofalias
giri ~ %exa -lah
Permissions Size User Date Modified Name
.rw-r--r--     0 giri 10 12 16:13   myalias
.rw-r--r--     0 giri 10 12 16:13   myfile
lrwxr-xr-x     6 giri 10 12 16:13   myofalias -> myfile
giri ~ %ls -al *alias
-rw-r--r--  2 giri  wheel  0 12 10 16:13 myalias
lrwxr-xr-x  1 giri  wheel  6 12 10 16:13 myofalias -> myfile
giri ~ %stat myalias 
16777220 338344 -rw-r--r-- 2 giri wheel 0 0 "Dec 10 16:13:28 2023" "Dec 10 16:13:28 2023" "Dec 10 16:13:34 2023" "Dec 10 16:13:28 2023" 4096 0 0 myalias
giri ~ %stat myofalias 
16777220 338349 lrwxr-xr-x 1 giri wheel 0 6 "Dec 10 16:13:52 2023" "Dec 10 16:13:52 2023" "Dec 10 16:13:52 2023" "Dec 10 16:13:52 2023" 4096 0 0 myofalias
```