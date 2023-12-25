# 시스템 정보 수집
- 리눅스 버전, 커널, 기타 관련 정보
```
cat /etc/*-release
cat /proc/version
uname -a
```
- 기본 하드웨어 장비(CPU, RAM, 디스크)
```
cat /proc/cpuinof
cat /proc/meminfo
cat /proc/diskstats
```
- BIOS 같은 시스템의 하드웨어에 대해
```
sudo dmidecode -t bios
```
- 전체 주 메모리와 스왑 사용량
```
free -ht
```
- 프로세스가 가질 수 있는 파일 디스크립터 수
```
ulimit -n
```