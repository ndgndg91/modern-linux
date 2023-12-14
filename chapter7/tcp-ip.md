# TCP/IP 스택
- 데이터는 패킷으로 캡슐화되며 각 계층은 일반적으로 해당 기능과 관련된 정보를 포함한 헤더로 데이터를 래핑
- 데이터를 보내려는 앱은 최상위 계층과만 직접 상호 작용하고, 최상위 계층데이터에서 헤더를 추가해 다시 아래 스택으로 내려보낸다.
- 반대로 앱이 데이터를 수신할 때는 이 데이터가 먼저 최하위 계층에 도착하고 각 계층이 차례대로 찾은 헤더 정보를 기반으로 처리해서 payload 를 상위 계층에 전달.

앱

---
애플리케이션 계층<br>
- 웹, ssh, 메일과 같은 사용자 대면 도구와 앱을 다루는 계층

---
전송 계층<br>
- 세션 기반의 안정적인 통신을 위한 TCP(Transmission Control Protocol) 과 비 연결형 통신을 위한 UDP(User Datagram Protocol) 사용해 종단 간 통신을 제어. 주로 패킷이 전송되는 방식을 다루며 포트를 통한 시스템의 개별 서비스 지정과 데이터 무결성이 포함. 소켓 통신을 사용

---
인터넷 계층<br>
- 인터넷 프로토콜을 이용. 라우팅에 초점을 맞춘 계층

---
링크 계층<br>
- 가장 하부 계층. 하드웨어(이더넷, 와이파이)와 커널 드라이버를 다루며 물리적 디바이스 간에 패킷이 어떻게 전송되는지 중점

```
인터넷은 네트워크들의 네트워크다. 
다양한 시스템 사이에서 통신이 가능하게 하는 백엔드 인프라에 연결된 수많은 로컬 네트워크라고 볼 수 있다.
```

## 링크 계층
- 바이트, 유선, 전자기파, 디바이스 드라이버, 네트워크 인터페이스와 같은 하드웨어, 혹은 하드웨어에 가까운 항목에 관한 것
### 이더넷(ethernet)
- 유선을 사용해 기기를 연결하는 네트워킹 기술. LAN(근거리 통신망)에서 사용
### 무선(wireless)
- 와이파이(wi-fi) 유선을 사용하지 않고 전자기파를 사용해 데이터를 전송
### MAC 주소
- media access control 각 하드웨어마다 고유한 48비트 식별자. 각 기기를 식별하는데 사용
### 인터페이스
- 물리적 인터페이스 또는 루프백 인터페이스 lo 같은 가상 인터페이스일 수 있다.

### 네트워크 인터페이스 컨트롤러
- Network interface controller 로 네트워크 인터페이스 카드라고도 부른다.
- NIC 은 전송하려는 바이트의 디지털 표현을 전기 혹은 전자기 신호로 바꾼다.
- 수신 경로의 경우 그 반대로. 수신하는 모든 물리적 신호를 소프트웨어가 처리할 수 있는 비트와 바이트로 변환한다.

루프백 인터페이스인 lo0, 최대 전송 단위 mtu 16384 바이트.
```
giri ~ %ifconfig
lo0: flags=8049<UP,LOOPBACK,RUNNING,MULTICAST> mtu 16384
        options=1203<RXCSUM,TXCSUM,TXSTATUS,SW_TIMESTAMP>
        inet 127.0.0.1 netmask 0xff000000
        inet6 ::1 prefixlen 128 
        inet6 fe80::1%lo0 prefixlen 64 scopeid 0x1 
        nd6 options=201<PERFORMNUD,DAD>
```

### 주소 결정 프로토콜
- Address Resolution Protocol 은 MAC 주소를 IP 주소에 매핑. 링크 계층을 위의 계층인 인터넷 계층과 연결하는 의미를 가진다.


## 인터넷 계층
- 네트워크의 한 시스템에서 다른 시스템으로 패킷을 라우팅하는 것과 관련. 실제 우편주소와 비슷한 개념. 컴퓨터는 논리 주소를 통해 인터넷 계층에서 식별된다.
- 기기를 논리적으로 고유하게 식별하기 위해서 전 세계적으로 압도적으로 많이 사용되는 프로토콜이 인터넷 프로토콜
- IP ipv4, ipv6

### IPv4
- 엔드포인트 역할을 하는 호스트나 프로세스를 고유하게 식별하는 32비트 숫자를 정의.
- 32비트를 마침표로 구분된 4개의 8비트 조각으로 분할하며 각 조각은 옥텟(octet)이라 부름
- 0~255 범위 `63.32.106.149`
- RFC 791 에 따라 IP 헤더에 사용자가 알아야 할 가장 중요한 필드는
  - 송신지 IP 주소(32비트) 
  - 수신지 IP 주소(32비트)
  - 프로토콜(8비트) : TCP, UDP
  - TTL(8비트)
  - 서비스유형(8비트) : QoS(Quality of Service)
- CIDR(Classless inter-Domain Routing) `10.0.0.0/24` -> `10.0.0.0 ~ 10.0.0.254` 이며 넷마스크는 `255.255.255.0`
- 예약된 IPv4
  - 127.0.0.0
    - 로컬 주소용으로 예약, 루프백 주소인 127.0.0.1
  - 169.254.0.0/16(169.254.0.0 ~ 169.254.255.255) 
    - 링크 로컬 주소로 전송된 패킷이 네트워크의 다른 부분으로 전달되지 않아야 함을 의미.
    - aws 같은 클라우드 공급자는 특수 서비스에 사용함
  - 224.0.0.0/24(224.0.0.0 ~ 239.255.255.255)
    - 멀티캐스트용으로 예약
- 사설 IP : 공용 인터넷에서 라우팅할 수 없음. 내부적으로 지정하는 편이 안전.
  - 10.0.0.0 ~ 10.255.255.255 (10/8 prefix)
  - 172.16.0.0 ~ 172.31.255.255 (172.16/12 prefix)
  - 192.168.0.0 ~ 192.168.255.255 (192.168/16 prefix)

### Ipv6
- TCP/IP 통신에서 엔드포인트 식별용으로 128비트 숫자
- 16비트로 구성된 8개 그룹을 콜론(:) 으로 구분하며 16진수를 사용
- 선행되는 0를 제거하거나 연속되는 0의 섹션을 압축해 2개의 콜론(::) 으로 대체
- ::1(IPv4 에서 127.0.0.1)
- IPv4 와 IPv6 는 호환되지 않는다.

### 인터넷 제어 메시지 프로토콜 (Internet Control Message Protocol)
- ping 으로 웹 사이트의 도달 가능성을 테스트
- gping
- IPv6 ping6
```
giri ~ %ping mhausenblas.info
PING mhausenblas.info (185.199.109.153): 56 data bytes
64 bytes from 185.199.109.153: icmp_seq=0 ttl=57 time=6.960 ms
64 bytes from 185.199.109.153: icmp_seq=1 ttl=57 time=6.005 ms
64 bytes from 185.199.109.153: icmp_seq=2 ttl=57 time=12.115 ms
64 bytes from 185.199.109.153: icmp_seq=3 ttl=57 time=13.504 ms
64 bytes from 185.199.109.153: icmp_seq=4 ttl=57 time=11.515 ms
64 bytes from 185.199.109.153: icmp_seq=5 ttl=57 time=6.380 ms
64 bytes from 185.199.109.153: icmp_seq=6 ttl=57 time=6.770 ms
64 bytes from 185.199.109.153: icmp_seq=7 ttl=57 time=12.620 ms
64 bytes from 185.199.109.153: icmp_seq=8 ttl=57 time=12.695 ms
64 bytes from 185.199.109.153: icmp_seq=9 ttl=57 time=11.654 ms
^C
--- mhausenblas.info ping statistics ---
10 packets transmitted, 10 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 6.005/10.022/13.504/2.909 ms
```
### 라우팅
- 패킷을 보낼 위치를 패킷별로 결정
- 라우팅 테이블 [iptables](https://jvns.ca/blog/2017/06/07/iptables-basics/)은 패킷을 가로채고 조작하기 위해 [netfilter](https://www.netfilter.org/)를 사용한다.
```
iri ~ %netstat -rn
Routing tables

Internet:
Destination        Gateway            Flags               Netif Expire
default            192.168.1.254      UGScg                 en0       
127                127.0.0.1          UCS                   lo0       
127.0.0.1          127.0.0.1          UH                    lo0       
169.254            link#8             UCS                   en0      !
192.168.1          link#8             UCS                   en0      !
192.168.1.21       d4:f5:47:1e:42:c0  UHLWIi                en0    773
192.168.1.23       56:9f:3b:1f:96:d2  UHLWI                 en0    295
192.168.1.25       d2:d6:f9:f8:26:c4  UHLWIi                en0   1034
192.168.1.28/32    link#8             UCS                   en0      !
192.168.1.45       54:3a:d6:f5:4f:44  UHLWI                 en0   1098
192.168.1.59       c6:ee:cc:cc:2b:4c  UHLWIi                en0    774
192.168.1.254/32   link#8             UCS                   en0      !
192.168.1.254      1c:ec:72:3:d6:88   UHLWIir               en0   1173
224.0.0/4          link#8             UmCS                  en0      !
224.0.0.251        1:0:5e:0:0:fb      UHmLWI                en0       
230.230.230.230    1:0:5e:66:e6:e6    UHmLWI                en0       
239.255.255.250    1:0:5e:7f:ff:fa    UHmLWI                en0       
255.255.255.255/32 link#8             UCS                   en0      !
```
- Destination
  - 수신지의 IP 주소 0.0.0.0 은 지정되지 않았거나 알 수없음을 의미. 잠재적으로 게이트웨이로 보낼 수 있음.
- Gateway
  - 동일한 네트워크에 있지 않은 패킷의 경우 게이트웨이 주소
- Genmask
  - 사용된 서브넷 마스크
- Flags
  - UG는 네트워크가 동작 중이며 이것이 게이트웨이임을 의미함.
- Iface, Netif
  - 패킷이 사용할 네트워크 인터페이스

### 경계 게이트웨이 프로토콜 (Border Gateway Protocol)
- 인터넷은 네트워크들의 네트워크.
- BGP 용어로 네트워크는 자율 시스템이라고 부르는데, IP 라우팅이 동작하려면 이런 자율 시스템들이 해당 라우팅 데이터와 도달 가능성 데이터를 공유하고 인터넷을 통해 패킷을 전달하는 경로를 알려야 한다.
- https://blog.cloudflare.com/october-2021-facebook-outage/

## 전송 계층
- 연결 지향 프로토콜, 비연결 프로토콜 존재. 신뢰성, QoS, 순차 배송이 중요한 부분.
### 포트
- 핵심 개념은 포트.
- IP 주소에서 사용 가능한 서비스를 식별하는 고유한 16비트
- /etc/services 에서 포트와 매핑 확인 가능
### 잘 알려진 포트(0 ~ 1023)
- SSH 서버나 웹 서버 같은 데몬용. 이들 중 하나를 사용(바인딩)하려면 높은 권한이 필요 (root 또는 CAP_NET_BIND_SERVICE 캐퍼빌리티)
### 등록된 포트(1024 ~ 49151)
- 인터넷 할당 번호 관리기관(Internet Assigned Numbers Authority)이 공개적으로 문서화된 프로세스를 통해 관리
### 한시적 포트(49152 ~ 65535)
- 등록할 수 없는 포트. 한시적 포트를 자동으로 할당하는 데 사용 혹은 개인 서비스에 사용

```
giri ~ %nmap -A localhost
Starting Nmap 7.94 ( https://nmap.org ) at 2023-12-15 00:07 KST
Nmap scan report for localhost (127.0.0.1)
Host is up (0.000077s latency).
Other addresses for localhost (not scanned): ::1
Not shown: 998 closed tcp ports (conn-refused)
PORT     STATE SERVICE VERSION
5000/tcp open  rtsp    AirTunes rtspd 710.79.1
|_rtsp-methods: ERROR: Script execution failed (use -d to debug)
7000/tcp open  rtsp    AirTunes rtspd 710.79.1
|_irc-info: Unable to open connection
|_rtsp-methods: ERROR: Script execution failed (use -d to debug)

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 34.41 seconds
```
### 전송 제어 프로토콜(Transmission control protocol)
- TCP 는 HTTP, SSH를 포함한 여러 고수준 프로토콜에서 사용되는 연결 지향 전송 계층 프로토콜.
- 패킷을 순서대로 전달하는 것을 보장하고 오류 발생 시 재전송을 지원하는 세션 기반 프로토콜.
- TCP 헤더에서 중요한것
  - 송신지 포트(16비트)
  - 수신지 포트(16비트)
  - 시퀀스 번호(32비트)
    - 순차적인 배송을 관리하기 위해 사용
  - 확인 응답 번호(32비트)
    - SYN 플래그와 ACK 플래그는 소위 말하는 TCP/IP 3웨이 핸드셰이크의 핵심
  - 플래그(9비트)
    - 가장 중요한 것은 SYN, ACK
  - 윈도(16비트)
    - 수신 창의 크기
  - 체크섬(16비트)
    - 오류 검사에 사용되는 TCP 헤더의 체크섬
  - 데이터
    - 전송할 페이로드 
- TCP 에는 방어 메커니즘이 없음. 페이로드는 일반 텍스트로 전송되며 발신자와 수신자 사이의 누구나 패킷 검사 가능.
  - wireshark
  - tshark
- 메시지 암호화는 TLS 필요하며 1.3 버전이 가장 이상적
### 사용자 데이터그램 프로토콜(User datagram protocol)
- UDP 는 TCP 의 핸드셰이크 없이 데이터그램이라고 부르는 메시지를 보낼 수 있는 비연결형 전송 계층 프로토콜.
- 무결성 보장을 위해 체크섬 지원
- NTP, DHCP, DNS 등에서 사용
- UDP 헤더의 중요한 것
  - 송신지 포트(16비트)
  - 수신지 포트(16비트)
  - 길이(16비트)
    - UDP 헤더와 데이터를 합친 총 길이
  - 체크섬(16비트)
    - 에러 확인을 위해 선택적으로 사용
  - 데이터
- 오버헤드가 거의 없고 높은 처리량 달성 가능
## 소켓
- 고수준의 통신 인터페이스 [소켓](https://www.man7.org/linux/man-pages/man7/socket.7.html)
- TCP 나 UDP 그리고 IP 주소와 포트로 구성된 튜플이라는 고유한 ID를 가진 통신의 엔드포인트
```
giri ~ %lsof -c chrome -i udp  | head -5
COMMAND     PID USER   FD   TYPE             DEVICE SIZE/OFF  NODE NAME
loginwind  1142 giri    4u  IPv4 0xe1b9f91e248783a5      0t0   UDP *:*
rapportd   1180 giri   11u  IPv4 0xe1b9f91e2487eba5      0t0   UDP *:*
rapportd   1180 giri   13u  IPv4 0xe1b9f91e26254fa5      0t0   UDP *:*
rapportd   1180 giri   14u  IPv4 0xe1b9f91e248957a5      0t0   UDP *:*
```
- `netstat`, `lsof`