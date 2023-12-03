# 커널 확장

## 모듈
- 요청 시 커널에 로드할 수 있는 프로그램
- 리눅스는 대부분의 하드웨어를 자동으로 감지해 해당 모듈을 자동으로 로드.

## eBPF
- 원래 `BPF(Berkeley Packet Filter)` 로 불렸다.
- 커널 버전 3.15 이상에서 지원하는 리눅스 커널 기능
```
## mac os x intel chip kernel version check
% uname -srm
Darwin 23.0.0 x86_64
```
- `bpf` 시스템 콜을 사용해 리눅스 커널 기능을 안전하고 효율적으로 확장. 
- 64비트 RISC 명령어 세트를 사용한 커널 내 가상 머신으로 구현.

### k8s pod networking 을 활성화하기 위한 CNI 플러그인
- [실리움(Cilium)](https://github.com/cilium/cilium)
- 프로젝트 칼리코(Project Calico)
- 서비스 확장성
### 관층가능성용
- [iovisor/bpftrace](https://github.com/iovisor/bpftrace) 같은 리눅스 커널 추적화 허블(Hubble)을 사용한 클러스터 설정의 경우를 위해 사용
### 보안 제어 역할
- CNCF [팔코(Falco)](https://falco.org/)와 같은 프로젝트에서 활용하듯이 컨테이너 런타임 스캔 수행 가능
### 네트워크 로드밸런싱용
- 페이스북의 L4 카트란(katran) 라이브러리에서 활용하듯이 LB 로도 사용.