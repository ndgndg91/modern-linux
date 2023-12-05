# 권한

## 파일 권한
- '리소스에 접근' 개념의 핵심. 리눅스에서 모든 것이 파일이다.
### 사용자
- 파일 소유자
### 그룹
- 하나 이상의 구성원
### 나머지
- 그 밖의 모두가 이 카테고리에 속함

### 읽기(r)
- 사용자는 파일의 내용을 볼 수 있음. 디렉터리의 경우 안에 있는 파일의 이름을 볼 수 있음.
### 쓰기(w)
- 사용자는 파일을 수정하고 삭제 가능. 디렉터리의 경우 안에서 파일을 만들고 이름을 바꾸고 삭제 가능.
### 실행(x)
- 사용자가 읽기 권한도 있는 경우 파일을 실행 가능. 디렉터리의 경우파일 정보에 접근할 수 있도록하여 이동(cd) 나열(ls) 할 수 있게 만든다.

### 그 밖의 파일 접근 속성
- `s` 실행 파일에 적용되는 `setuid/setgid` 권한. 이를 실행하는 사용자는 파일 소유자 또는 그룹의 유효한 권한을 상속 받음.
- `t` 디렉터리에만 관련된 스티키 비트(stick bit). 해당 옵션이 설정된 경우 디렉토리/파일을 소유한 사용자가 아닌 비 root 사용자가 파일을 삭제하지 못하게 한다.

```
% exa -lhag
Permissions Size User Group Date Modified Name
.rw-r--r--     0 giri staff  3 12 11:45   .localized
```

<table>
<tr>
<td>패턴</td>
<td>적용되는 권한</td>
<td>십진법 표기</td>
</tr>
<tr>
<td>---</td>
<td>없음</td>
<td>0</td>
</tr>
<tr>
<td>--x</td>
<td>실행</td>
<td>1</td>
</tr>
<tr>
<td>-w-</td>
<td>쓰기</td>
<td>2</td>
</tr>
<tr>
<td>-wx</td>
<td>쓰기와 실행</td>
<td>3</td>
</tr>
<tr>
<td>r--</td>
<td>읽기</td>
<td>4</td>
</tr>
<tr><td>r-x</td>
<td>읽기와 실행</td>
<td>5</td>
</tr>
<tr><td>rw-</td>
<td>읽기와 쓰기</td>
<td>6</td>
</tr>
<tr><td>rwx</td>
<td>읽기와 쓰기와 실행</td>
<td>7</td>
</tr>
</table>

### 755
- 소유자는 모든 권한을 가지며, 그외 모든 사람은 읽기와 쓰기 권한을 가짐.
### 700
- 소유자는 모든 권한을 가지며, 그외 모든 사람은 아무 권한 없음.
### 664
- 소유자와 그룹은 읽기와 쓰기 권한을 가지며, 나머지는 아무 권한 없음.
- 내가 파일을 만들 때 기본 권한.
### 644
- 소유자는 읽기와 쓰기 권하을 가지며, 그룹과 나머지는 읽기 권한만 있음.
### 400
- 소유자만 읽기 가능.

### chmod
```
% exa -algh /tmp/my-file.txt 
Permissions Size User Group Date Modified Name
.rw-r--r--     0 giri wheel  5 12 22:26   /tmp/my-file.txt
% chmod +x /tmp/my-file.txt 
% exa -algh /tmp/my-file.txt
Permissions Size User Group Date Modified Name
.rwxr-xr-x     0 giri wheel  5 12 22:26   /tmp/my-file.txt
```
### chown
```
% sudo chown root /tmp/my-file.txt 
Password:
% exa -algh /tmp/my-file.txt     
Permissions Size User Group Date Modified Name
.rwxr-xr-x     0 root wheel  5 12 22:26   /tmp/my-file.txt
```

## 프로세스 권한

### RUID
- 프로세스를 시작한 사용자의 UID. 인간 사용자 관점에서 프로세스 소유권을 나타냄.
### EUID
- 리눅스 커널은 메시지 대기열과 같은 공유 리소스에 접근 시 EUID(유효 사용자 effective user ID)를 사용해 프로세스가 갖는 권한을 결정.
### 저장된 SUID
- 프로세스가 실제 UID와 저장된 SUID 사이에서 유효 UID를 전환함으로써 권한을 가정할 수 있을 때 사용. 예를 들어, 프로세스가 특정 네트워크 포트를 사용하도록 허용하려면 root로 실행되는 것처럼 높은 권한이 필요.
### FUID
- 파일시스템(Filesystem) UID 는 리눅스 전용 ID로서 파일 접근 권한을 결정하는 데 사용. 파일 서버가 일반 사용자를 대행해서 동작하되 해당 사용자가 보내는 시그널로부터 프로세스를 격히하는 사용 사례를 지원하기 위해 도입.