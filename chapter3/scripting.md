# 스크립팅
- 작업 자동화
- 대부분의 스크립트는 배시 셸로 작성된다.
- 대상 시스템에서 대부분 배시 셸을 사용할 가능성이 높다.

## 기본 개요
### 고급 데이터 유형
- 배열
```
bash-3.2$ os=('Linux', 'macOS', 'Windows')
bash-3.2$ echo "${os[0]}"
Linux,
bash-3.2$ numberofos="${#os[@]}"
bash-3.2$ echo $numberofos
3
```
- 흐름 제어
```
bash-3.2$ for afile in /tmp/* ; do
>     echo "$afile"
> done
/tmp/KSDownloadAction.gQgDWj1sJf
/tmp/KSInstallAction.a91S38pbHl
/tmp/KSOutOfProcessFetcher.UTODxE7ddT
/tmp/another
/tmp/com.apple.launchd.gZTf5YSSuz
/tmp/com.apple.launchd.mK28cXnXr5
/tmp/com.google.Keystone
/tmp/powerlog
/tmp/something

bash-3.2$ for i in {1..10}; do
>     echo "$i"
> done
1
2
3
4
5
6
7
8
9
10

while true; do
    echo "infinite loop"
done
```
- 함수
```
bash-3.2$ sayhi() {
>     echo "Hi $1 hope you are well"
> }
bash-3.2$ sayhi "giri"
Hi giri hope you are well
```

- 고급 I/O
```
bash-3.2$ read name
giri
bash-3.2$ printf 'Hello %s\n' "$name"
Hello giri
```

### 이식 가능한 스크립트 실행
- `#!` 셔뱅(shebang) 또는 해시뱅(hashbang) 사용하여 인터프리터를 선언
- chomod +x 등을 사용해 실행 가능하게 만들기, 연관된 사용자와 그룹에게만 허용하기
- 스켈레톤 템플릿
```
#!/usr/bin/env bash
set -o errexit # 오류가 발생하면 실행을 중지
set -o nounset # 설정되지 않은 변수는 오류로 처리하도록 정의
set -o piprefail # 파이프의 한 부분이 고장나면 전체 파이프가 고장난 것으로 간주

firstargument="${1:-somedefaultvalue}" # 기본값이 있는 명령행 매개변수

echo "$firstargument"
```

### Best Practice
- errexit, piepfail 등으로 빠르고 요란하게 실패한다.
- 민감한 정보는 하드코딩하지 않는다.
- 변수에 정상적인 기본값을 설정한다.
- 내장된 도구이거나 대상 환경을 알고 있지 않는 한, 특정 도구나 명령을 사용할 수 있다고 가정하지 말아야 한다.
- 스크립트가 실패했을 때 사용자가 실행할 수 있는 지침을 제공해야 한다.
- 인라인으로 문서화한다.
- 버전 관리한다.
- lint 하고 test 한다. ([ShellCheck](https://blog.davidjeddy.com/2018/11/27/using-shellcheck-to-lint-your-bash-sh-scripts/)) ([bats](https://github.com/sstephenson/bats))


