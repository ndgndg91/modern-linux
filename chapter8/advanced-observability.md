# 고급 관측가능성
- 추적(tracing)은 단일 시스템에서는 시간 경과에 따른 프로세스 실행(사용자 공간에서의 함수 호출이나 시스템 콜 등)을 캡처하는 것.
    - 리눅스 커널
      - 커널의 함수에서나, 시스템 콜에 의해 트리거. 커널 프로브(kprobe)나 커털 트레이스포인트(tracepoint)
    - 사용자 공간
      - 사용자 공간 프로브(uprobe)를 통하는 등의 애플리케이션 함수 호출은 추적 소스 역할을 할 수 있음.
- strace
- perf
- 앞으로는 eBPF 가 추적을 구현하는 사실상 표준이 될 것으로 보인다.
- 프로파일링 : 자주 호출되는 코드 섹션을 식별하는 것
  - pprof
  - valgrind
  - flame graph
- 지속적인 프로파일링(continuous profiling)은 시간 경과에 따라 추적(커널과 사용자 공간)을 캡처하는 프로파일링의 고급 버전.

## 프로메테우스와 그라파나
- 시계열 데이터를 다루고 고급 관측성을 고려하는 경우 사용
- [node exporter](https://github.com/prometheus/node_exporter)를 사용하여 CPU, 메모리, 네트워크까지 다양한 시스템 지표를 노출할 수 있다.
- 프로메테우스를 사용해 node exporter 를 스크랩한다.
- node exporter 는 /metrics 를 통해 http endpoint 를 프로메테우스에게 [OpenMetrics](https://openmetrics.io/) 형식의 지표를 제공한다.
- 그라파나의 데이터 소스로 프로메테우스로 사용한다.