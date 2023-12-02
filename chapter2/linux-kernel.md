# 리눅스 아키텍처

## 하드웨어 계층
- CPU, Memory, Disk Drive, Network Interface 그리고 키보드 모니터와 같은 주변 디바이스를 일컫는다. 
## 커널 계층
- 사용자 영역 사이에
## 사용자 영역(user land) 계층
- shell 운영체제 구성요소, ps나 ssh 같은 유틸리티, GUI 를 비롯해 대부분의 앱이 실행되는 곳을 일컫는다.

### System call, syscall
- 커털과 사용자 영역 사이에는 시스템 콜이라는 인터페이스가 있다.


커널 모드
- 추상화를 제한함으로써 빠르게 실행함을 의미
사용자 모드
- 상대적으로 느리지만 더 안전하고 편리한 추상화를 의미한다.


CPU 아키텍처 확인 command (인텔칩 맥북 프로)
```
% uname -a
Darwin namdong-gil-ui-MacBookPro.local 23.0.0 Darwin Kernel Version 23.0.0: Fri Sep 15 14:42:42 PDT 2023; root:xnu-10002.1.13~1/RELEASE_X86_64 x86_64
```
x86 아키텍처
- 인텔에서 개발했으며 나중에 AMD(advanced Micro Devices)에도 라이선스된 명령어 세트 제품군이다.
- 커널 내에서 x64는 인텔 64비트 프로세서를 나타내고 x86은 인텔 32비트를 뜻하며, amd64는 AMD 64비트 프로세서를 말한다.
- 데스크톱, 노트북, 서버에서 널리 사용된다.
- 비순차적 실행 out-of order-execution 에 대한 의존도가 높아 멜트다운 같은 보안 문제와 관련에 최근 관심을 받았다.

ARM 아키텍처
- RISC(Reduced Instruction Set Computing) 아키텍처 제품이다.
- 일반적으로 더 빠르게 실행할 수 있는 작은 명령어 세트와 많은 일반 CPU 레지스터로 구성된다.
- 최소한의 전력 소비에 중점을 뒀기에 아이폰 같은 휴대용 디바이스, 라즈베리파이 같은 IoT 임베디드 시스템에서 ARM 기반 칩을 찾아볼 수 있다.
- x86 칩보다 빠르고 저렴하며 발열량이 적기에 데이터 센터에서 AWS Graviton 같은 ARM 기반 CPU 가 점점 많이 발견된다.
  [AWS Graviton](https://aws.amazon.com/ko/ec2/graviton/)

RISC-V 아키텍처
- RISC-V(리스크 파이브) 개방형 RISC 표준
- 새롭고 널리 사용되지 않는 CPU 제품군