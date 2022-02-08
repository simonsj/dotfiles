# Command prompt
export PS1='[\u@\h : \W] '

# Various bin paths
export PATH="$HOME/bin:$PATH"

# for Homebrew Ruby version
export PATH="/usr/local/opt/ruby/bin:/usr/local/opt/sqlite/bin:$PATH"

# git stuff
export GIT_EDITOR='vim'
alias gb='git branch'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gdc='git diff --cached'
alias gfo='git fetch --all --prune --verbose'
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

alias psme='ps -ef | grep `whoami`'
alias KILL='kill -9'
alias no='grep -v'
alias fn='find . -iname'
alias g='grep'

alias lt='ls -altrh'

# Bash history
export HISTSIZE=10000
export HISTCONTROL="ignoredups:erasedups"
export HISTIGNORE="ls:pwd:gow:hgt"
shopt -s histappend

export HOMEBREW_NO_ANALYTICS=1
export BASH_SILENCE_DEPRECATION_WARNING=1

# tmux attach-to-first-or-create
alias tm='tmux list-sessions 2>/dev/null ; if [ $? = 0 ]; then tmux attach ; else tmux ; fi'
