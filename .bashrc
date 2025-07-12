# Command prompt
hostname=$(uname -s | grep -q Darwin && scutil --get ComputerName || hostname)
export PS1="[\u@$hostname : \W] "

# Various bin paths
export PATH="$HOME/bin:/opt/homebrew/bin:$PATH"
test -f "$HOME/.cargo/env" && . "$HOME/.cargo/env"

# git stuff
export GIT_EDITOR='vim'
alias gb='git branch'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gdc='git diff --cached'
alias gfo='git fetch --all --prune --verbose --no-tags'
alias gl='git log'
alias gs='git status'

# Aliases and history settings
alias vi='vim'

if [ $(uname) = "Linux" ]; then
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
export HISTIGNORE="ls:pwd:lt"
shopt -s histappend

export HOMEBREW_NO_ANALYTICS=1
export BASH_SILENCE_DEPRECATION_WARNING=1

# tmux attach-to-first-or-create
alias tm='tmux new-session -A -s 0'

# say 'pbcopy' on Linux
if [ $(uname) = "Linux" ]; then
  alias pbcopy="xclip"
fi

alias p3='python3'

alias treeml='tree -P "*.ml|*.mli"'

if test -t 0; then
  bind '"\e[A":'
  bind '"\e[B":'
fi

squashlog () {
  local REV=${1:-origin/main..HEAD};
  local HEAD_CMD=$(uname -s | grep -q Darwin && echo "ghead" || echo "head");
  git log --reverse --no-merges --format=' - %s%n%n%w(0,3,3)%b' ${REV} |
    ${HEAD_CMD} -n -1 | tr '\n' '%' | sed -e 's/%%%/%%/g' | tr '%' '\n'
}
export -f squashlog
