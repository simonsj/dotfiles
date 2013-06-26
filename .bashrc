# Command prompt

# Various bin paths
export PATH="$HOME/bin:$PATH"

# git stuff
GIT_EDITOR='vim'
alias gb='git branch'
alias gd='git diff'
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
   find . -name ".git" -prune \
        -o -name "svn" -prune \
        -o -name "tags" -prune \
        -o -type f -exec grep --binary-files=without-match -H "$@" \{\} \;
}

function hgt {
   history | grep "$@" | tail
}

function gofeed {
   cd ~/code/ofeed-scratch
   node ./node-mirror/nm.js . &
   node ./node-mirror/nm.js . 1338 &
   cd -
}
