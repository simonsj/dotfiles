# Command prompt
export PS1='[\u@\h : \W] '

# Various bin paths
export PATH="$HOME/bin:$PATH"
export GOPATH="$HOME/code/gopath"

# git stuff
export GIT_EDITOR='vim'
alias gb='git branch'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gdc='git diff --cached'
alias gfo='git fetch origin --prune --verbose'
alias gl='git log'
alias gs='git status'

# Aliases and history settings
alias vi='vim'

if [ $(uname) = "Linux" ]
then
  alias ls='ls --color=auto'
else
  # On MacOSX 'export CLICOLOR=1' yields the above effect.
  export CLICOLOR=1
fi

alias h='history'
alias psme='ps -ef | grep `whoami`'
alias ifconfig='/sbin/ifconfig'
alias gmode='alias vi="gvim"'
alias KILL='kill -9'
alias no='grep -v'
alias fc='find . -type f -name "*.[ch]"'
alias ff='find . -type f'
alias fn='find . -iname'
alias g='grep'

alias lt='ls -altrh'
alias sl='screen -list'
alias sr='screen -r'
alias tl='tmux list-sessions'

alias zulu='date "+%Y-%m-%dT%H:%M:%SZ"'

function TS {
  ts "%FT%H:%M:%.S"
}

# Bash history
export HISTSIZE=10000
export HISTCONTROL="ignoredups:erasedups"
export HISTIGNORE="ls:pwd:gow:hgt"
shopt -s histappend

function hgt {
   history | grep "$@" | tail
}

export HOMEBREW_NO_ANALYTICS=1
