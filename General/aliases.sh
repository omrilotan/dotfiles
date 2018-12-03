# General
alias holdmybeer=sudo
alias l='ls -lAhFG --color' # l(long)A(all but dot)h(human readable volumes)F(type symbols)G(colourise)
alias q='exit'
alias copy=pbcopy
alias paste=pbpaste
alias date='gdate' # brew install coreutils
alias ts='date +%Y-%m-%d\ %H:%M'

# Dotfiles
alias reload='source ~/dotfiles/init.sh'
alias dotfiles='edit ~/dotfiles'

# network
alias ports='lsof -i -P | grep -i listen'
alias ip='ipconfig getifaddr en0'
alias flushcache='sudo dscacheutil -flushcache'
alias dnscacheflush='sudo dscacheutil -flushcache'
alias hosts='edit /etc/hosts'
alias noidle='pmset noidle &'
function idle {
	ps aux | grep noidle | awk '{print $2}' | while read in; do echo "$in"; done;
}

# Editors
alias edit=sub
alias sub='/Applications/Sublime\ Text\.app/Contents/SharedSupport/bin/subl'
alias atom='/Applications/Atom.app/Contents/Resources/app/atom.sh'
alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
alias github='/Applications/GitHub\ Desktop.app/Contents/Resources/app/static/github.sh open $(pwd)'
alias work='edit . && git pull origin master'

# JS
alias scripts="cat package.json | jq '.scripts'"

# Mac
alias bg='open /Library/Caches/com.apple.desktop.admin.png'
