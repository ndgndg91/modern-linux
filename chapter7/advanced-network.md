# 고급 네트워크

## whois
- 등록 정보와 사용자 정보를 조회할 때 사용할 수 있는 whois 디렉터리 서비스용 클라이언ㅌ,
```
giri ~ %whois ietf.org
% IANA WHOIS server
% for more information on IANA, visit http://www.iana.org
% This query returned 1 object

refer:        whois.publicinterestregistry.org

domain:       ORG

organisation: Public Interest Registry (PIR)
address:      11911 Freedom Drive,
address:      10th Floor, Suite 1000
address:      Reston VA 20190
address:      United States of America (the)

contact:      administrative
name:         Director of Operations, Compliance and Customer Support
organisation: Public Interest Registry (PIR)
address:      11911 Freedom Drive,
address:      10th Floor, Suite 1000
address:      Reston VA 20190
address:      United States of America (the)
phone:        +1 703 889 5778
fax-no:       +1 703 889 5779
e-mail:       ops@pir.org

contact:      technical
name:         Senior Director, DNS Infrastructure Group
organisation: Donuts Inc.
address:      10500 NE 8th Street, Suite 750
address:      Bellevue WA 98004
address:      United States of America (the)
phone:        1.425.298.2200
fax-no:       1.425.671.0020
e-mail:       tldtech@donuts.email

nserver:      A0.ORG.AFILIAS-NST.INFO 199.19.56.1 2001:500:e:0:0:0:0:1
nserver:      A2.ORG.AFILIAS-NST.INFO 199.249.112.1 2001:500:40:0:0:0:0:1
nserver:      B0.ORG.AFILIAS-NST.ORG 199.19.54.1 2001:500:c:0:0:0:0:1
nserver:      B2.ORG.AFILIAS-NST.ORG 199.249.120.1 2001:500:48:0:0:0:0:1
nserver:      C0.ORG.AFILIAS-NST.INFO 199.19.53.1 2001:500:b:0:0:0:0:1
nserver:      D0.ORG.AFILIAS-NST.ORG 199.19.57.1 2001:500:f:0:0:0:0:1
ds-rdata:     26974 8 2 4fede294c53f438a158c41d39489cd78a86beb0d8a0aeaff14745c0d16e1de32

whois:        whois.publicinterestregistry.org

status:       ACTIVE
remarks:      Registration information:
remarks:      http://publicinterestregistry.org

created:      1985-01-01
changed:      2022-06-03
source:       IANA

# whois.publicinterestregistry.org

Domain Name: ietf.org
Registry Domain ID: 73d0271a0fc745c3b8b632a5032ae75a-LROR
Registrar WHOIS Server: http://whois.cloudflare.com
Registrar URL: http://www.cloudflare.com
Updated Date: 2023-06-26T01:01:27Z
Creation Date: 1995-03-11T05:00:00Z
Registry Expiry Date: 2026-03-12T05:00:00Z
Registrar: CloudFlare, Inc.
Registrar IANA ID: 1910
Registrar Abuse Contact Email: registrar-abuse@cloudflare.com
Registrar Abuse Contact Phone: +1.6503198930
Domain Status: serverDeleteProhibited https://icann.org/epp#serverDeleteProhibited
Domain Status: clientTransferProhibited https://icann.org/epp#clientTransferProhibited
Registry Registrant ID: REDACTED FOR PRIVACY
Registrant Name: REDACTED FOR PRIVACY
Registrant Organization: IETF Trust
Registrant Street: REDACTED FOR PRIVACY
Registrant City: REDACTED FOR PRIVACY
Registrant State/Province: CA
Registrant Postal Code: REDACTED FOR PRIVACY
Registrant Country: US
Registrant Phone: REDACTED FOR PRIVACY
Registrant Phone Ext: REDACTED FOR PRIVACY
Registrant Fax: REDACTED FOR PRIVACY
Registrant Fax Ext: REDACTED FOR PRIVACY
Registrant Email: Please query the RDDS service of the Registrar of Record identified in this output for information on how to contact the Registrant, Admin, or Tech contact of the queried domain name.
Registry Admin ID: REDACTED FOR PRIVACY
Admin Name: REDACTED FOR PRIVACY
Admin Organization: REDACTED FOR PRIVACY
Admin Street: REDACTED FOR PRIVACY
Admin City: REDACTED FOR PRIVACY
Admin State/Province: REDACTED FOR PRIVACY
Admin Postal Code: REDACTED FOR PRIVACY
Admin Country: REDACTED FOR PRIVACY
Admin Phone: REDACTED FOR PRIVACY
Admin Phone Ext: REDACTED FOR PRIVACY
Admin Fax: REDACTED FOR PRIVACY
Admin Fax Ext: REDACTED FOR PRIVACY
Admin Email: Please query the RDDS service of the Registrar of Record identified in this output for information on how to contact the Registrant, Admin, or Tech contact of the queried domain name.
Registry Tech ID: REDACTED FOR PRIVACY
Tech Name: REDACTED FOR PRIVACY
Tech Organization: REDACTED FOR PRIVACY
Tech Street: REDACTED FOR PRIVACY
Tech City: REDACTED FOR PRIVACY
Tech State/Province: REDACTED FOR PRIVACY
Tech Postal Code: REDACTED FOR PRIVACY
Tech Country: REDACTED FOR PRIVACY
Tech Phone: REDACTED FOR PRIVACY
Tech Phone Ext: REDACTED FOR PRIVACY
Tech Fax: REDACTED FOR PRIVACY
Tech Fax Ext: REDACTED FOR PRIVACY
Tech Email: Please query the RDDS service of the Registrar of Record identified in this output for information on how to contact the Registrant, Admin, or Tech contact of the queried domain name.
Name Server: jill.ns.cloudflare.com
Name Server: ken.ns.cloudflare.com
DNSSEC: signedDelegation
URL of the ICANN Whois Inaccuracy Complaint Form: https://www.icann.org/wicf/
>>> Last update of WHOIS database: 2023-12-17T04:49:45Z <<<
```

## 동적 호스트 구성 프로토콜(DHCP)
- Dynamic Host Configuration Protocol 은 IP 주소를 호스트에 자동으로 할당할 수 있는 네트워크 프로토콜.
## 네트워크 타임 프로토콜(NTP)
- 네트워크를 통해 컴퓨터의 시계를 동기화하기 위한 것.
- ntpq 명령을 사용해 명시적인 타임 서버 쿼리 가능.

## whireshark 와 tshark
- 저수준의 네트워크 트래픽 분석을 하려는 경우, 스택 전체의 패킷을 정확히 봐야 할 때는 cli tshark
- tshark GUI 버전 wireshark 사용
- https://tshark.dev/setup/install/

## 그 밖의 고급 도구
- socat
  - 2개의 양방향 바이트 스트림을 설정하고 엔드포인트 간에 데이터를 전송이 가능하게 한다.
- geoiplookup
  - IP 를 지리적 영역에 매핑
- 터널
  - VPN 과 기타 사이트 간 네트워킹 솔루션의 대안이며 사용하기도 수월. inlets 같은 도구로 활성화

  