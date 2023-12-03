# 인간 친화적인 셸
- 배시는 1980년대 후반에 나온 셸이라 아쉬운 점들이 있다. 이를 보완하기 위한 여러 모던 셸을 살표보자

## [피시 셸](https://fishshell.com/)
- 사용자 친화적이며 똑똑한 커맨드라인 셸

### 기본 사용법
- fish 는 명시적인 이력 관리가 없다
  - 간단한 입력으로 명령어의 이전 실행 기록을 확인 가능
  - 상하 이동 키로 선택 가능
- fish 는 대다수 명령에 대해 자동완성을 지원한다.
  - tab 키로 명령, 인수, 경로에 대한 자동완성을 가이드한다.
- fish 는 마지막 명령의 종료 상태를 `$?` 이 아니라 `$status` 라는 변수에 저장한다.
### 구성
- fish_config 명령 하나면 가능 
- http://localhost:8080 통해 서버를 시작하고 브라우저에서 설정 가능

## [Z셸](https://zsh.sourceforge.io/Doc/)
- 본(Bourne) 셸과 유사하며 강력한 자동 완성 시스템과 풍부한 테마를 지원
- Oh My Zsh 사용 시 셸과의 광범위한 하위 호환성 유지
```
# $ZDOTDIR 설정되지 않은 경우 zsh 는 대신 $HOME 을 사용
$ZDOTDIR/.zshenv
$ZDOTDIR/.zprofile
$ZDOTDIR/.zshrc
$ZDOTDIR/.zlogin
$ZDOTDIR/.zlogout
```
### zshenv
- 셸의 모든 호출에 제공
### zshrc
- 대화형 셸에 제공. 앨리어스, 함수, 옵션, 키 바인딩 등 설정하는 명령이 포함

## 그 밖의 최신 셸
-  [오일 셸](https://www.oilshell.org/)
- [뮤렉스](https://github.com/lmorg/murex)
- [누셸](https://www.nushell.sh/)