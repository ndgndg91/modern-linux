# 기본 개요

### 사용자
- 프로세스를 실행하고 파일을 소유함. 프로세스는 커널이 메인 메모리에 로드해 실행하는일종의 프로그램.
### 파일
- 소유자가 존재함. 파일을 만든 사용자가 파일을 소유.
### 프로세스
- 의사소통과 지속성을 위해 파일을 사용. 사용자는 프로세스를 통해 파일을 간접적으로 사용.

## 접근 제어 유형

### 임의 접근 제어(discretionary access control)
- 사용자의 신분을 기반으로 리소스에 대한 접근을 제한할 수 있음. 특정 권한을 가진 사용자가 이를 다른 사용자에게 전달 가능.
### 강제 접근 제어(mandatory access control)
- 보안 수준을 나타내는 계층 모델을 기반. 사용자에게 허용 등급이 할당, 리소스에는 보안 레이블이 할당. 사용자는 허용 등급 이하로 설정된 리소스에만 접근할 수 있음. 관리자가 모든 권한을 설정하여 엄격하고 배타적으로 접근을 제어.

### 전부 아니면 전무 (all-or-nothing)
- 사용자는 모든 것을 변경할 수 있는 권한을 가진 수퍼유저나 접근이 제한된 일반 사용자 중 하나이다.