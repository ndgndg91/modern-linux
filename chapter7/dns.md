# DNS
- IP 주소는 기억하기 어렵고 바뀔 수 있지만 이름은 동일하게 유지된다.
- 간단한 해결 방법은 /etc/hosts 이용해 이름과 IP 주소 간의 매핑을 로컬로 유지하는 것. 이러한 중앙 집중식 접근 방식으로는 성장하는 인터넷을 따라갈 수 없음.
- 따라서 1980년대 초에 분산 시스템이 설계됨. RFC 1034, RFC 1035
  - 도메인 네임 스페이스(domain name space)
    - .(마침표)가 루트인 트리 구조로, 각 트리 노드와 리프에는 특정 공간에 대한 정보가 포함.
    - 리프에서 루트까지의 경로인 레이블(최대 길이 63비트)을 정규화된 도메인 네임(fully qualified domain name) 이라 함.
  - 리소스 레코드(resource record)
    - 노드나 리프에 있는 페이로드
  - 네임 서버(name server)
    - 도메인 트리 구조에 대한 정보를 가지고 있는 서버.
    - 네임 스페이스에 대한 완전한 정보를 가지고 있는 경우 authoritative name server 임.
    - authoritative 정보는 zone 으로 구성
  - 리졸버(resolver)
    - 클아이언트 요청에 대한 응답으로 네임 서버에서 정보를 추출하는 프로그램.
    - 로컬에 있는 시스템
- 쿼리 프로세스에서 리졸버는 루트부터 시작해 권한 있는 네임 서버를 반복적으로 쿼리하거나, 네임 서버가 리졸버를 대신해 다른 네임서버를 재귀적으로 대신 쿼리하기도 함.
- 루트에는 최상위 도메인의 레코드를 관리하는 [13개의 루트 서버 존재](https://www.iana.org/domains/root/servers)
- 루트 바로 아래에는 최상위 도메인(top-leve domain TLD) 존재
    - 인프라 최상위 도메인
      - IANA가 IETF 를 대신해 관리하며 example 과 localhost 등을 포함
    - 일반 최상위 도메인(gTLD)
      - .org, .com 처럼 3개 이상의 문자가 포함왼 일반 도메인
    - 국가 코드 최상위 도메인(ccTLD)
      - 두 글자로 된 ISO 국가 코드(country code) 가 할당된 국가나 지역을 위한 도메인
    - 스폰서 최상위 도메인(sTLD)
      - .aero, .gov 같이 TLD 를 사용할 수 있는 자격을 제한하는 규칙을 세우고 시행하는 민간 기관이나 조직을 위한 도메인
## DNS 레코드
- A record(RFC 1035)와 AAAA record(RFC 3596)
  - 각각 IPv4, IPv6 주소 record. 호스트 이름을 호스트 IP 주소에 매핑하는 데 사용
- CNAME record(RFC 1035)
  - alias 를 다른 이름에 제공하는 canonical name record
- NS record(RFC 1035)
  - 권위 있는 네임 서버를 사용하도록 DNS 존을 위임
- PTR record(RFC 1035)
  - 역방향 DNS 조회를 수행하는 데 사용되는 포인터 레코드. A 레코드의 반대.
- SRV record(RFC 2782)
  - 서비스 로케이터 레코드. 일반적인 탐색 메커니즘. (메일 교환을 위해 사요한 MX 레코드 유형의 경우와 같음)
- TXT record(RFC 1035)
  - 보안 관련 DNS 확장의 맥락에서 기계가 판독할 수 있는 데이터가 있는 경우가 많음.
## DNS 조회
- host 명령을 사용해 로컬 네임을 쿼리해서 IP 주소를 확인
```
giri ~ %host -a localhost
Trying "localhost"
Host localhost not found: 3(NXDOMAIN)
Received 102 bytes from 168.126.63.1#53 in 13 ms
```

```
giri ~ %host mhausenblas.info
mhausenblas.info has address 185.199.108.153
mhausenblas.info has address 185.199.111.153
mhausenblas.info has address 185.199.110.153
mhausenblas.info has address 185.199.109.153
```
- IP 주소를 쿼리해서 도메인 네임을 확인
```
giri ~ %host 185.199.108.153

153.108.199.185.in-addr.arpa domain name pointer cdn-185-199-108-153.github.com.
```
- DNS 레코드 조회 `dig` `nslookup`
```
giri ~ %dig mhausenblas.info

; <<>> DiG 9.10.6 <<>> mhausenblas.info
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 64266
;; flags: qr rd ra; QUERY: 1, ANSWER: 4, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
;; QUESTION SECTION:
;mhausenblas.info.              IN      A

;; ANSWER SECTION:
mhausenblas.info.       1799    IN      A       185.199.111.153
mhausenblas.info.       1799    IN      A       185.199.108.153
mhausenblas.info.       1799    IN      A       185.199.109.153
mhausenblas.info.       1799    IN      A       185.199.110.153

;; Query time: 119 msec
;; SERVER: 168.126.63.1#53(168.126.63.1)
;; WHEN: Fri Dec 15 01:00:26 KST 2023
;; MSG SIZE  rcvd: 109
```
```
giri ~ %nslookup mhausenblas.info 
Server:         168.126.63.1
Address:        168.126.63.1#53

Non-authoritative answer:
Name:   mhausenblas.info
Address: 185.199.111.153
Name:   mhausenblas.info
Address: 185.199.110.153
Name:   mhausenblas.info
Address: 185.199.108.153
Name:   mhausenblas.info
Address: 185.199.109.153
```