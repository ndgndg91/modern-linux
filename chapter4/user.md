# 사용자

## 시스템 사용자 또는 시스템 계정
- 프로그램(daemon) 은 이런 유형의 계정을 사용하여 백그라운드 프로세스를 실행함. 이러한 프로그램이 제공하는 서비스는 네트워킹(sshd) 같은 운영체제의 일부이거나 애플리케이션 계층(mysql)에 있을 수 있음.
## 일반 사용자
- 셸을 통해 리눅스를 대화식으로 사용하는 인간 사용자 유형

### UID 0
- root 사용자
### UID 1 ~ 999
- 시스템 사용자에게 지정됨
### UID 65534
- nobody 사용자. NFS (network file system) 의 경우 원격 사용자에 매핑하는데 사용됨.
### UID 1000 ~ 65533 그리고 65536 ~ 4294967294
- 일반 사용자

- 자신의 uid 확인하는 방법
```
% id -u 
501
```

## 로컬에서 사용자 관리하기
- 시스템에 로컬로 저장된 정보만 사용되며 사용자 관련 정보는 시스템 네트워크에서 공유 되지않음.

<table>
    <tr><td>목적</td><td>파일</td></tr>
    <tr><td>사용자 데이터베이스</td><td>/etc/passwd</td></tr>
    <tr><td>그룹 데이터베이스</td><td>/etc/group</td></tr>
    <tr><td>사용자 비밀번호</td><td>/etc/shadow</td></tr>
    <tr><td>그룹 비밀번호</td><td>/etc/gshadow</td></tr>
</table>


```
% bat /etc/passwd
File: /etc/passwd
───────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   1   │ ##
   2   │ # User Database
   3   │ # 
   4   │ # Note that this file is consulted directly only when the system is running
   5   │ # in single-user mode.  At other times this information is provided by
   6   │ # Open Directory.
   7   │ #
   8   │ # See the opendirectoryd(8) man page for additional information about
   9   │ # Open Directory.
  10   │ ##
  11   │ nobody:*:-2:-2:Unprivileged User:/var/empty:/usr/bin/false
  12   │ root:*:0:0:System Administrator:/var/root:/bin/sh
  13   │ daemon:*:1:1:System Services:/var/root:/usr/bin/false
```

```
 % bat /etc/group
 File: /etc/group
───────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   1   │ ##
   2   │ # Group Database
   3   │ # 
   4   │ # Note that this file is consulted directly only when the system is running
   5   │ # in single-user mode.  At other times this information is provided by
   6   │ # Open Directory.
   7   │ #
   8   │ # See the opendirectoryd(8) man page for additional information about
   9   │ # Open Directory.
  10   │ ##
  11   │ nobody:*:-2:
  12   │ nogroup:*:-1:
  13   │ wheel:*:0:root
  14   │ daemon:*:1:root
  15   │ kmem:*:2:root
  16   │ sys:*:3:root
  17   │ tty:*:4:root
  18   │ operator:*:5:root
  19   │ mail:*:6:_teamsserver
  20   │ bin:*:7:
  21   │ procview:*:8:root
  22   │ procmod:*:9:root
  23   │ owner:*:10:
  24   │ everyone:*:12:
  25   │ _taskgated:*:13:_taskgated
  26   │ group:*:16:
  27   │ staff:*:20:root
  28   │ _networkd:*:24:
  29   │ _installassistant:*:25:
  30   │ _lp:*:26:
  31   │ _postfix:*:27:
  32   │ _postdrop:*:28:
  33   │ certusers:*:29:root,_jabber,_postfix,_cyrus,_calendar,_dovecot
  34   │ _keytabusers:*:30:_calendar,_jabber,_postfix
  35   │ _scsd:*:31:
  36   │ _ces:*:32:
  37   │ _appstore:*:33:_appstore
  38   │ utmp:*:45:
  39   │ authedusers:*:50:
  40   │ interactusers:*:51:
  41   │ netusers:*:52:
  42   │ consoleusers:*:53:
  43   │ _mcxalr:*:54:
  44   │ _appleevents:*:55:
  45   │ _geod:*:56:
  46   │ _devdocs:*:59:
  47   │ _sandbox:*:60:
  48   │ localaccounts:*:61:
  49   │ netaccounts:*:62:
  50   │ _mdnsresponder:*:65:
  51   │ _uucp:*:66:
  52   │ _ard:*:67:
  53   │ dialer:*:68:
  54   │ network:*:69:
  55   │ _www:*:70:_devicemgr,_teamsserver
  56   │ _eppc:*:71:_eppc
  57   │ _cvs:*:72:
```

## 중앙집중식 사용자 관리

### 디렉터리 기반
- LDAP(Lightweight Directory Access Protocol) - IP(Internet Protocol)를 통해 분산 디렉터리를 접근하고 유지 관리하는 방법. LDAP server 를 직접 실행하거나 cloud service 사용
### 네트워크 이용 
- 커버로스(Kerberos) 사용하여 네트워크로 사용자를 인증할 수 있음.
### 구성 관리 시스템 이용
- 앤서블(Ansible), 셰프(Chef), 퍼핏(Puppet), 솔트스택(SaltStack) 등의 시스템을 사용해 여러 컴퓨터에서 일관되게 사용자 생성.