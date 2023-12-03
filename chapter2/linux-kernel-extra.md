# 정리
- 커널이 하드웨어의 차이(CPU 아키텍처와 주변 디바이스)를 추상화하기 때문에 리눅스의 이식정을 매우 높인다.
- 가장 중요한 인터페이스는 시스템 콜 인터페이스로 파일 열기, 메모리 할당, 네트워크 인터페이스 목록 출력 등의 컬널 기능을 사용자가 쓸 수 있도록 놀출 한다.

## 일반 주제
- [리눅스 커널 교육](https://linux-kernel-labs.github.io/refs/heads/master/lectures/intro.html)
- [리눅스 커널 분석](https://developer.ibm.com/articles/l-linux-kernel/)
- [운영체제 커널](https://www.cs.cornell.edu/courses/cs614/2007fa/Slides/kernel%20architectures.pdf)
- [커널 초보자](https://kernelnewbies.org/)
- [커널 통계](https://github.com/udoprog/kernelstats)
- [리눅스 커널 맵](https://makelinux.github.io/kernel/map/)
## 메모리 관리
- [리눅스 가상 메모리 관리자 이해하기](https://www.kernel.org/doc/gorman/pdf/understand.pdf)
- [리눅스 커널의 슬랩 할당자](https://hammertux.github.io/slab-allocator)
- [커널 문서](https://www.kernel.org/doc/html/latest/admin-guide/mm/index.html)
## 시스템 콜
- [리눅스 인터럽트: 기본 개념](https://www.cs.montana.edu/courses/spring2005/518/Hypertextbook/jim/media/interrupts_on_linux.pdf)
- [리눅스 커널:시스템 콜](https://linux-kernel-labs.github.io/refs/heads/master/lectures/syscalls.html)
- [리눅스 시스템 콜 테이블](http://faculty.nps.edu/cseagle/assembly/sys_call.html)
- [syscalls.h 소스 코드](https://elixir.bootlin.com/linux/latest/source/include/linux/syscalls.h)
- [x86 및 x86_64의 시스템 콜 조회](https://filippo.io/linux-syscall-table/)
## eBPF
- [맷 오스왈트의 eBPF 소개](https://oswalt.dev/2021/01/introduction-to-ebpf/)
- [eBPF 맵 문서](https://prototype-kernel.readthedocs.io/en/latest/bpf/ebpf_maps.html)