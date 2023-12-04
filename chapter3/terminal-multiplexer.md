# 터미널 멀티플렉서
- 두 개 혹은 여러 창에서 동시에 상호 의존적인 작업을 수행해야 할 때
- 논리적으로 하나의 단위에 속해 있으며 기간으로는 단기에서 장기까지 다양한 경우

## [screen](https://www.gnu.org/software/screen/)
- 원조 터미널 멀티플렉서
- 오늘날 지원이 미비해서 사용하지 않는 것을 추천
- 최신 터미널 멀티플렉서에 비해 기능 미비

## [tmux](https://github.com/tmux/tmux)
### 세션
- 작업 논리 단위
### 윈도
- 세션에 속한 단위, 브라우저의 탭처럼 생각할 수 있음. 선택사항이며 세션당 하나의 윈도만 가능
### 영역
실행 가능한 단일 셸 인스턴스. 윈도의 일부로 세로나 가로로 분할 가능 및 확대/축소 가능


## 그 밖의 멀티플렉서
### tmuxinator
### Byobu
### Zellij
### dvtm
### 3mux