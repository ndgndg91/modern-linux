# [가상 파일시스템(Virtual file system)](https://elixir.bootlin.com/linux/latest/source/Documentation/filesystems/vfs.rst)
- 추상화를 통해 다양한 종류의 리소스(in-memory, 네트워크 스토리지)에 파일과 유사한 접근을 제공한다.
- system call 과 개별 파일시스템 사이에 간접 계층을 도입
- 파일 체계를 기반으로 system call 이 동일한 방법으로 리소스에 접근할 수 있게 해주는 커널의 추상화 계층

### ext3, XFS, FAT, NTFS 같은 로컬 파일시스템
- HDD, SSD 와 같은 로컬 블록 디바이스에 접근
### 장기 저장 디바이스가 지원하지 않지만 주 메모리(RAM)에 상주하는 tmpfs 와 같은 인메모리 파일시스템
### procefs 같은 의사 파일시스템
### NFS, 삼바(Samba), 넷웨어(Netware)
- 실제 데이터가 상주하는 저장 디바이스는 로컬이 아니라 원격으로 연결

## 시스템 콜 예시
<table>
<tr>
<td>카테고리</td>
<td>시스템 콜 얘시</td>
</tr>
<tr>
<td>아이노드</td>
<td>chmod, chown, stat</td>
</tr>
<tr>
<td>파일</td>
<td>open, close, seek, truncate, read, write</td>
</tr>
<tr>
<td>디렉터리</td>
<td>chdir, getcwd, link, unlink, rename, symlink</td>
</tr>
<tr>
<td>파일시스템</td>
<td>mount, flush, chroot</td>
</tr>
<tr>
<td>그 외</td>
<td>mmap, poll, sync, flock</td>
</tr>
</table>

### inode
- 핵심 파일시스템 객체, 캡처 유형, 소유권, 권한, 링크, 파일 데이터를 포함하는 브록에 대한 포인터
### file
- 열려 있는 파일음 나타냄
### dentry(디렉터리 항목)
- 부모와 자식 저장
### super_block
- 마운트 정보를 포함한 파일시스템을 나타냄
### 그 외
- vfsmount, file_system_type 포함

## 논리 볼륨 관리자
- 파티션은 저장 공간 양을 변경하기 위한 크기 조정이 필요할 때 사용하기 어렵다.
### 물리 볼룸(PV)
- 디스크 파티션, 전체 디스크 드라이브, 기타 디바이스 등
### 논리 볼룸(LV)
- 볼륨 그룹(VG) 에서 생성된 블록 디바이스, 개념적으로 파티션과 비슷. 사용 중에 논리 볼륨의 크기를 쉽게 조정 가능.
### 볼륨 그룹(VG)
- 물리 볼륨과 논리 볼륨 사이의 중개자. 볼륨 그룹이란 공동으로 리소스를 제공하는 물리 볼륨 풀.

### PV 관리 도구
- lvmdiskscan
- pvdisplay
- pvcreate
- pvscan
### VG 관리 도구
- vgs
- vgdisplay
- vgcreate
- vgextend
### LV 관리 도구
- lvs
- lvscan
- lvcreate

## 파일 시스템 작업
1. 파일시스템 생성 
```
# ext4 유형의 파일시스템을 논리 볼륨에 생성한다.
mkfs -t ext4 /dev/some_vg/some_lv
```
2. 파일시스템 마운트 - `mount`

## 범용 파일시스템 레이아웃
- Filesystem Hierachy Standard(FHS) 구조와 내부에 들어갈 권장 파일 목록을 포함해 디렉토리를 정의
- 실제로는 리눅스 배포한에 따라 크게 달라진다.

<table>
<tr>
<td>디렉터리</td>
<td>의미</td>
</tr>
<tr>
<td>bin, sbin</td>
<td>시스템 프로그램과 명령(일반적으로 /usr/bin 과 /usr/sbin 에 링크되어 있음)</td>
</tr>
<tr>
<td>boot</td>
<td>커널 이미지와 관련 구성요소</td>
</tr>
<tr>
<td>dev</td>
<td>디바이스(터미널, 드라이브 등)</td>
</tr>
<tr>
<td>etc</td>
<td>시스템 구성 파일</td>
</tr>
<tr>
<td>home</td>
<td>사용자 홈 디렉터리</td>
</tr>
<tr>
<td>lib</td>
<td>공유 시스템 라이브러리</td>
</tr>
<tr>
<td>mnt, media</td>
<td>이동식 미디어용 마운트 지점(ex: USB)</td>
</tr>
<tr>
<td>opt</td>
<td>배포판 지정 디렉터리, 패키지 관리자 파일을 호스팅할 수 있음.</td>
</tr>
<tr>
<td>proc, sys</td>
<td>커널 인터페이스</td>
</tr>
<tr>
<td>tmp</td>
<td>임시 파일용</td>
</tr>
<tr>
<td>usr</td>
<td>사용자 프로그램(일반적으로 읽기 전용)</td>
</tr>
<tr>
<td>var</td>
<td>사용자 프로그램(로그, 백업, 네트워크, 캐시 등)</td>
</tr>
</table>