# 사용자와 프로세스 작업
- 특정 사용자에 대해 프로세스별 시스템 메트릭(CPU, 메모리 등) 표시
```
top -U giri
```
- 세부 정보와 함께 모든 프로세스(모든 사용자)를 트리 형식으로 나열
```
ps faux
```
- 특정 프로세스를 찾기
```
ps -e | grep java
ps -e | rg java
```
- pid 로 프로세스 종료
```
kill ${pid}
```