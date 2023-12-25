# 시간과 날짜 작업
- 로컬 시간, UTC 시간, 동기화 상태와 같은 시간 관련 정보 쿼리
```
timedatectl status
```
- YYYY-MM-DD 형식
```
giri ~ %date +"%Y-%m-%d"
2023-12-25
```
- 유닉스 epoch 타임스탬프를 생성
```
giri ~ %date +%s
1703492800
```
- ISO 8601 형식의 UTC 타임스탬프 생성
```
giri ~ %date -u +"%Y-%m-%dT%H:%M:%SZ"
2023-12-25T08:27:30Z
```
- 동일한 ISO 8601 타임스탬프 형식이지만 로컬 시간
```
giri ~ %date +%FT%TZ
2023-12-25T17:27:58Z
```