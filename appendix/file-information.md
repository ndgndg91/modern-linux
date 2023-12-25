# 파일 정보 수집
- 파일 세부 정보를 쿼리
```
giri ~ %stat README.md 
16777220 219977 -rw-r--r-- 1 giri staff 0 23 "Dec  3 12:11:00 2023" "Dec  3 12:10:59 2023" "Dec  3 12:10:59 2023" "Dec  3 12:10:59 2023" 4096 8 0 README.md
```
- 셸이 명령을 해석하는 방법과 실행 파일이 있는 위치 등에 관한 명령
```
giri ~ %type cat
cat is /bin/cat
giri ~ %which cat
/bin/cat
```
# 파일과 디렉토리 작업
- 파일의 텍스트 내용 표시
```
giri ~ %cat README.md 
# Learning Modern Linux%                                                                                                                                                                             giri ~ %bat README.md 
───────┬─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
       │ File: README.md
───────┼─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   1   │ # Learning Modern Linux
───────┴─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
```
- 디렉토리의 내용을 나열, 추가 명령 사용 가능
```
giri ~ %ls -l /etc | wc -l
       1
```
- 파일과 파일 콘텐츠를 찾기
```
giri ~ %find ./ -name "*.md"
.//appendix/linux-cheat-sheet.md
.//chapter8/advanced-observability.md
.//chapter8/observability-overview.md
.//chapter8/logging.md
.//chapter8/monitoring.md
.//chapter6/latest-package-manager.md
.//chapter6/linux-application-supply-chain.md
.//chapter6/container.md
.//chapter6/greeting/README.md
.//chapter6/application-packagemanage-container-overview.md
.//chapter6/package-packagemanager.md
.//chapter6/init-system.md
.//chapter6/linux-boot-process.md
.//chapter7/tcp-ip.md
.//chapter7/network-overview.md
.//chapter7/dns.md
.//chapter7/application-layer-networking.md
.//chapter7/advanced-network.md
.//chapter9/security-tools.md
.//chapter9/virtual-machine.md
.//chapter9/modern-linux-distribution.md
.//chapter9/advance-topic-IPC.md
.//README.md
.//chapter5/normal-file.md
.//chapter5/filesystem-overview.md
.//chapter5/pseudo-filesystem.md
.//chapter5/virtual-filesystem.md
.//chapter2/linux-kernel-extra.md
.//chapter2/linux-kernel.md
.//chapter2/linux-kernel-extension.md
.//chapter2/linux-kernel-component.md
.//chapter3/terminal-multiplexer.md
.//chapter3/basic.md
.//chapter3/human-friendly-sh.md
.//chapter3/scripting.md
.//chapter4/authority.md
.//chapter4/access-control.md
.//chapter4/user.md

find . -type -f -exec grep -H README.md {} \;
```
```
giri ~ %find . -type f -exec grep -H README.md {} \; 
./appendix/linux-cheat-sheet.md:giri ~ %stat README.md 
./appendix/linux-cheat-sheet.md:16777220 219977 -rw-r--r-- 1 giri staff 0 23 "Dec  3 12:11:00 2023" "Dec  3 12:10:59 2023" "Dec  3 12:10:59 2023" "Dec  3 12:10:59 2023" 4096 8 0 README.md
./appendix/linux-cheat-sheet.md:giri ~ %cat README.md 
./appendix/linux-cheat-sheet.md:# Learning Modern Linux%                                                                                                                                                                             giri ~ %bat README.md 
./appendix/linux-cheat-sheet.md:       │ File: README.md
./appendix/linux-cheat-sheet.md:.//chapter6/greeting/README.md
./appendix/linux-cheat-sheet.md:.//README.md
./appendix/linux-cheat-sheet.md:find . -type -f -exec grep -H README.md {} \;
Binary file ./.git/index matches
```
- 파일 간의 차이점
```
diff -u {a} {b}
```
- 글자 변경
```
giri ~ %echo 'Com_Acme_Library' | tr '_A-Z' '.a-z'
com.acme.library
```
- 문자열 일부 교체
```
echo 'foo bar baz' | sed -e 's/foo/quux/'
quux bar baz
```
- 테스트를 위해 특정 크기의 파일을 생성
```
giri ~ %dd if=/dev/zero of=output.dat bs=1024 count=1000
1000+0 records in
1000+0 records out
1024000 bytes transferred in 0.006430 secs (159253499 bytes/sec)
```