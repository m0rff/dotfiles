# Set locales
export LC_ALL=en_US.UTF-8 && export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Set up zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# Set some good ZSH options
export HISTFILE=~/.zsh_history # Where it gets saved
export HISTSIZE=10000
export SAVEHIST=10000
setopt append_history # Don't overwrite, append!
setopt INC_APPEND_HISTORY # Write after each command
setopt hist_expire_dups_first # Expire duplicate entries first when trimming history.
setopt hist_fcntl_lock # use OS file locking
setopt hist_ignore_all_dups # Delete old recorded entry if new entry is a duplicate.
setopt hist_lex_words # better word splitting, but more CPU heavy
setopt hist_reduce_blanks # Remove superfluous blanks before recording entry.
setopt hist_save_no_dups # Don't write duplicate entries in the history file.
setopt share_history # share history between multiple shells
setopt HIST_IGNORE_SPACE # Don't record an entry starting with a space.

# zplug themeing stuff
zplug mafredri/zsh-async, from:github
# zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
zplug romkatv/powerlevel10k, as:theme, depth:1

# Autosuggestions
zplug "zsh-users/zsh-autosuggestions"
if zplug check zsh-users/zsh-autosuggestions; then
  ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down) # Add history-substring-search-* widgets to list of widgets that clear the autosuggestion
  ZSH_AUTOSUGGEST_CLEAR_WIDGETS=("${(@)ZSH_AUTOSUGGEST_CLEAR_WIDGETS:#(up|down)-line-or-history}") # Remove *-line-or-history widgets from list of widgets that clear the autosuggestion to avoid conflict with history-substring-search-* widgets
fi

# Syntax highlighting
zplug "zsh-users/zsh-syntax-highlighting"

# History Substring Search
zplug "zsh-users/zsh-history-substring-search"
if zplug check zsh-users/zsh-history-substring-search; then
  zmodload zsh/terminfo
  bindkey "$terminfo[cuu1]" history-substring-search-up
  bindkey "$terminfo[cud1]" history-substring-search-down
fi

# Enhanced cd, enhanced ls and alias tips
zplug "supercrabtree/k"
zplug "b4b4r07/enhancd", use:init.sh
zplug 'djui/alias-tips'

# Oh my ZSH plugins: Git, Docker, Composer
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/composer",   from:oh-my-zsh
zplug "plugins/docker",   from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# Some handy aliases
alias v='vim '
alias l='exa -bgl'
alias ls='exa'

# Autocomplete support SSH configs from Google Drive
h=()
if [[ -r ~/.ssh/config ]]; then
  h=($h ${${${(@M)${(f)"$(cat /Volumes/GoogleDrive/My\ Drive/Intern/Sync/ssh/*.sshconf ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
fi
if [[ -r ~/.ssh/known_hosts ]]; then
  h=($h ${${${(f)"$(cat ~/.ssh/known_hosts{,2} || true)"}%%\ *}%%,*}) 2>/dev/null
fi
if [[ $#h -gt 0 ]]; then
  zstyle ':completion:*:ssh:*' hosts $h
  zstyle ':completion:*:slogin:*' hosts $h
fi

# Load fzf. See https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ITerm integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/usr/local/opt/php@7.4/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
