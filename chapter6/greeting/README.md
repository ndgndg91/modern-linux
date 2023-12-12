greeter.service 와 greeter.timer 를 /run/systemd/system 에 이동하면 자동으로 timer 를 systemd 가 사용한다.

타이머 확인
```
sudo systemctl status greeter.timer
```

동작 여부 확인
```
journalctl -f -u greeter.service
```