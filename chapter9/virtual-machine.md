# 가상 머신
- 서버와 같은 물리적 머신을 사용해 여러 가상 머신을 에뮬레이션할 수 있도록 만들어진 기술
- 서로 다른 테넌트에서 서로 다른 워크로드를 강하게 격리된 방식으로 실행할 수 있는 유연하고 강력한 방법
- x86 아키텍처를 위한 하드웨어 지원 가상화에 중점.
- 호스트 커널에서 네이티브로 실행되는 프로세스는 게스트 프로세스와 격리된다.
- 호스트의 물리적 CPU, 메모리는 게스트 활동의 영향을 받지 않는다. 하지만 아래와 같은 예외가 있을 수 있다.
  - 로우해머(rowhammer)
  - 멜트다운(meltdown)
  - 스펙터(spectre)
### CPU
- 하드웨어 가상화를 지원해야 함.
### 커널 기반의 가상 머신(Kernel-based virtual machine)
- KVM AMD-V 나 인텔-VT 등과 같이 가상화 확장을 지원하는 x86 하드웨어용 리눅스 네이티브 가상화 솔루션
- KVM 에서 리눅스 커널은 하이퍼바이저 역할
- I/O 가상화를 허용하는 버티오(Virtio) 통합 드라이버
### 사용자 공간의 구성요소
- 가상 머신 모니터(VMM)
  - `QEMU`와 `Firecracker` 같은 가상 디바이스를 에뮬레이트.
  - 프로그래밍 방식으로 사용 가능 libvirt
- 게스트 커널
  - 일반적으로는 리눅스 커널이지만 윈도우일 수 있음.
- 게스트 프로세스
  - 게스트 커널에서 실행

### 파이어크래커
- KVM 인스턴스를 관리할 수 있는 가상 머신 모니터(VMM)
- rust 로 작성
- AWS lambda, AWS fargate 같은 서버리스 제품을 위해 개발
- 동일한 물리적 시스템에서 멀티 테넌트 워크로드를 안전하게 실행하도록 설계
- VMM은 호스트에 HTTP API 를 노출하는 마이크로 가상 머신(MicroVM)이란 것을 관리해 사용자가 이 microVM 을 시작, 쿼리, 중지할 수 있게 해준다.
- 호스트에서 TUN/TAP 디비ㅏ이스를 사용해 네트워크 인터페이스를 에뮬레이트하고 블록 디바이스는 버티오 디바이스를 지원하는 호스트의 파일에 의해 지원