# append to the history file, don't overwrite it
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
shopt -u histappend

HISTSIZE=100000

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias c='crond -f'
alias u='apt -y update; apt -y upgrade; git -C ~/dotfiles submodule foreach "git checkout master; git pull origin master"'
alias ojt='g++ main.cpp; oj t -iSt 2.2'
alias ojs='g++ main.cpp; oj s -y main.cpp'
function ojd {
    p="";
    if [[ $1 == *http* ]]; then d=`basename $1`; mkdir $d; cd $d; p=$1;
    else d=`basename $PWD`; mkdir $1; cd $1; $p=`oj d https://atcoder.jp/contests/$d/tasks/$d\_$1`; fi
    oj d $p;
    cp ../../temp.cpp main.cpp; vim main.cpp;
}
alias ojk='kill -9 `jobs -ps`'
alias xrnormal='xrandr --output DP-1 --rotate right --scale 1.2x1.2 --output DP-2 --pos 1296x400'
alias xrlarge='xrandr --output DP-1 --rotate right --scale 2.4x2.4 --output DP-2 --pos 2592x1400'
alias xrmid='xrandr --output DP-1 --rotate right --scale 1.7x1.7 --output DP-2 --pos 1837x900'
alias xrdef='xrandr --output DP-1 --rotate right --scale 1x1 --output DP-2 --pos 1080x350'
function nkfd { echo $1 | nkf -w --url-input; }
function nkfe { echo $1 | nkf -WwMQ | tr = %; }
function based { echo $1 | base64; }
function basee { echo $1 | base64 -di; }

# termuxで32bitの実行ファイルを動かすための設定
# unset LD_PRELOAD

# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -x /usr/bin/mint-fortune ]; then
     /usr/bin/mint-fortune
fi

# git branch
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}
function promps {
  local BLUE="\[\e[1;34m\]"
  local RED="\[\e[1;31m\]"
  local GREEN="\[\e[1;32m\]"
  local WHITE="\[\e[00m\]"
  local GRAY="\[\e[1;37m\]"

  case $TERM in
    xterm*) TITLEBAR='\[\e]0;\W\007\]';;
    *) TITLEBAR="";;
  esac
  local BASE="\u@\h"
  PS1="${TITLEBAR}${GREEN}${BASE}${WHITE}:${BLUE}\w${GREEN}\$(parse_git_branch)${BLUE}\$${WHITE} "
}
promps

# vi
alias vi=vim

# KP_Enter -> Return
#xmodmap ~/.xmodmap

export TERM='xterm-256color'

# GOPATH
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on

# JAVA
export JAVA_HOME="/usr/lib/jvm/java-13-openjdk"
export PATH=$PATH:/usr/local/android-ndk-r16b
export NDKROOT=/usr/local/android-ndk-r16b

# SH
export PATH=$PATH:$HOME/app/bin


if $(tmux has-session); then
    tmux attach
else
    tmux
fi

export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
export KERAS_BACKEND=plaidml.keras.backend
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"

export EDITOR=vim
