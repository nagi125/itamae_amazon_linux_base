# Alias設定
alias la='ls -al'
alias ll='ls -l'

alias g=git
alias v=vim
alias del='rm -rf'

# cdで移動時にlaを実行
cd() {
  builtin cd "$@" && la
}

# Gitブランチ表示
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

# プロンプトの表記を変更(branchを表示)
function promps {
  local  BLUE="\[\e[1;34m\]"
  local  RED="\[\e[1;31m\]"
  local  GREEN="\[\e[1;32m\]"
  local  WHITE="\[\e[00m\]"
  local  GRAY="\[\e[1;37m\]"

  local BASE="\u@\h"
  #PS1="${TITLEBAR}${GREEN}${BASE}${WHITE}:${BLUE}\W${GREEN}\$(parse_git_branch)${BLUE}\$${WHITE} "
  PS1="${BLUE}\h:\w${GREEN}\$(parse_git_branch)${WHITE}\$ "
}

# prompt書き換えを実行
promps

# 環境依存系読み込み
if [ -f ~/.bashrc.local ] ; then
  source ~/.bashrc.local
fi
