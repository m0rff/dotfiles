ZSH=~/.oh-my-zsh
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
DISABLE_AUTO_UPDATE="true"
setopt appendhistory autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/morth/.zshrc'
ZSH_THEME="kolo"

autoload -Uz compinit
compinit
# End of lines added by compinstall
autoload -U colors && colors

#function
ssh() {
  command ssh "$@"
  echo "Counting to 60"
  sleep 60 && exit
}
# aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias mkdir='mkdir -p -v'
alias df='df -h'
alias du='du -c -h'
alias openports='netstat --all --numeric --programs --inet'

# privileged access
if [ $UID -ne 0 ]; then
  alias sudo='sudo '
  alias scat='sudo cat'
  alias sn='sudo nano'
  alias root='sudo -s'
  alias reboot='sudo reboot'
fi

alias update='yaourt -Syyua'
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"
# ls
alias ls='ls -hF --color=auto'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lm='la | more'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias vi='vim'
alias tmux='tmux -2'
alias enl='echo "\e[1;32m              ^.                \r\n              Xx\\.              \r\n              X| x\\.            \r\n              X|   ^x)          \r\n              X|    /   ._      \r\n              <X\\.     / x\\.    \r\n                 ^    X\\   x\\._ \r\n        _..xxXXxx.__    ^x%%/^  \r\n    ./x/           ^\\x..        \r\n  ~^^^   _.      ._    ^^       \r\n          ^\\xXXx/^      +._     \r\n                      .%  ^?/   \r\n               xxX     \\. //    \r\n               X|       \\/^     \r\n               X|   .           \r\n               X|  \\X.          \r\n               X|   \\x.         \r\n               X|    )x         \r\n               X|  ./x          \r\n               X| /x^           \r\n               XxxX^            \r\n               XX^              \r\n               X^               \r\n               ^ \r\n"'
plugins=(git archlinux z extract zsh-syntax-highlighting common-aliases git-extras systemd tmux)
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
