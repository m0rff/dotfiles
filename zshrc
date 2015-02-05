# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/morth/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
autoload -U promptinit && promptinit
prompt pure
autoload -U colors && colors
autoload -Uz compinit
compinit

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

# ls
alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lA='ls -d .??*'               # show only hidden files
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias vi='vim'
