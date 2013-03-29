# Command prompt

# Various bin paths
export PATH="$HOME/bin:$PATH"

# Aliases and history settings
alias vi='vim'

if [ $(uname) = "Linux" ]
then
  alias ls='ls --color'
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
alias ff='find . -type f'
alias fn='find . -iname'
alias g='grep'

alias lt='ls -altrh'
alias sl='screen -list'
alias sr='screen -r'

# Bash history
export HISTSIZE=10000
export HISTCONTROL="ignoredups:erasedups"
export HISTIGNORE="ls:pwd:gow:hgt"

function gfind {
   find . -type f -exec grep --binary-files=without-match -H "$@" \{\} \; | grep -v "svn" | grep -v "\.git"
}

function hgt {
   history | grep "$@" | tail
}
