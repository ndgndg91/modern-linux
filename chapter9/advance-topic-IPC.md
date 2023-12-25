# 프로세스 간 통신(IPC)
- 파이프, 소켓, 공유 메모리 등 사용 가능한 프로세스 간 통신 옵션이 매우 많다.
- 프로세스가 통신하고, 활동을 동기화하고 데이터를 공유한다.

## 시그널
- 커널이 특정 이벤트를 사용자 공간 프로세스에 알리기 위한 방법으로 개발
- 프로세스에 전송되는 비동기 알림
- 프로세스 중지나 종료와 같은 기본 동작이 함께 제공.
<table>
<tr>
<td>시그널</td>
<td>의미</td>
<td>기본 동작</td>
<td>처리 옵션</td>
<td>키 조합</td>
</tr>
<tr>
<td>SIGHUP</td>
<td>구성 파일을 다시 읽도록 데몬 프로세스에 지시</td>
<td>프로세스 종료</td>
<td>nohup 혹은 커스텀 핸들러</td>
<td>없음</td>
</tr>
<tr>
<td>SIGINT</td>
<td>사용자가 키보드로 보내는 인터럽트 시그널</td>
<td>프로세스 종료</td>
<td>커스텀 핸들러</td>
<td>Ctrl+C</td>
</tr>
<tr>
<td>SIGQUIT</td>
<td>사용자가 키보드로 보내는 종료 시그널</td>
<td>코어 덤프 및 프로세스 종료</td>
<td>커스텀 핸들러</td>
<td>Ctrl+\</td>
</tr>
<tr>
<td>SIGKILL</td>
<td>종료 시그널</td>
<td>프로세스 종료</td>
<td>처리 불가능</td>
<td>없음</td>
</tr>
<tr>
<td>SIGSTOP</td>
<td>프로세스 중지</td>
<td>프로세스 중지</td>
<td>처리 불가능</td>
<td>Ctrl+Z</td>
</tr>
<tr>
<td>SIGTERM</td>
<td>정상적인 종료</td>
<td>프로세스 종료</td>
<td>커스텀 핸들러</td>
<td>없음</td>
</tr>
</table>

## 이름 있는 파이프
- 한 프로세스의 stdout을 다른 프로세스의 stdin과 연결해 데이터를 전달하는 데 사용할 수 있는 파이프(|)는 이름 없는 파이프 (unnamed pipe)
- 이름을 지정할 수 있는 파이프(named pipe)
- I/O(open, write 등)와 함께 동작할 수 있으며 선입선출(FIFO) 방식을 사용.
- named pipe 의 수명은 함께 사용하는 프로세스의 수명으로 제한되지 않는다.
- pipefs 의사(pseudo) 파일시스템을 사용하는 파이프의 wrapper.
```
giri ~ %mkfifo examplepipe
giri ~ %ls -l examplepipe 
prw-r--r--  1 giri  staff  0 Dec 17 23:41 examplepipe
```
- 일반 파일처럼 보인다.
- 하나의 방향과 하나의 컨슈머만 지원

## 유니스 도메인 소켓
- 양방향 다자간 통신 엔드포인트.
- 여러 컨슈머를 가질 수 있음.
- 스트림 지향(SOCK_STREAM), 데이터그램 지향(SOCK_DGRAM), 시퀀스 패킷(SCOK_SEQPACKET) 등 세가지 종류로 제공.
- 주소를 찾는 작업은 파일시스템 경로 이름을 기반으로 동작.
- IP 주소와 포트를 사용하지 않고 간단한 파일 경로를 사용
