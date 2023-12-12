# 패키지와 패키지 관리자
- 레드햇 계열(RHEL, Fedora, CentOS) 와 데비안 기반 시스템(데비안, 우분투 등)에서 에서 유래
### 패키지 그 자체
- 압축된 파일 하나, 메타데이터가 포함
### 도구(패키지 관리자라고 불림)
- 해당 패키지를 처리해 앱을 설치하고 유지 관리. 사용자를 대신해 저장소와 상호 작용하고 패키지의 로컬 캐시를 유지 관리.

## RPM 패키지 관리자
.rpm 파일 형식은 리눅스 표준 베이스에서 사용되며 바이너리나 소스 파일을 포함할 수 있음.

### yum
- 아마존 리눅스, 센트OS, 페도라, RHEL 에서 사용
### DNF
- 센트OS, 페도라, RHEL 에서 사용
### Zypper(자이퍼)
- 오픈수세, 수세 리눅스 엔터프라이즈에서 사용
```
# yum search golang
# yum install golang
```

## 데이반 deb
- .dev 파일 형식은 데비안 배포판에서 시작됐으며, dev 패키지는 바이너리나 소스 파일도 포함할 수 있다. dpkg 처럼 종속성 관리가 없는 저수준 패키지 관리자와 ap-t-get, apt, aptitude 같은 고수준 패키지 관리자를 포함해 많은 패키지 관리자가 deb 사용. 데스크탑과 서버 모두에서 널리 사용.

```
apt search curl
apt install curl
apt show curl
```

## 프로그래밍 언어별 패키지 관리자
### c/c++
- Conan, vcpkg 포함한 다양한 패키지 관리자 존재
### go
- built in (go get, go mod)
### Node.js
- npm
### Java
- maven, gradle, nuts
### Python
- pip, pyPM
### Ruby
- rubygems, rails
### Rust
- cargo