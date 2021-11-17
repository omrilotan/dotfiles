# General
alias holdmybeer='sudo su'
alias l='ls -lAhFG --color' # l(long)A(all but dot)h(human readable volumes)F(type symbols)G(colourise)
alias q='exit'
alias copy=pbcopy
alias paste=pbpaste
alias date='gdate' # brew install coreutils
alias ts='date +%Y-%m-%d\ %H:%M'
alias dir='du -sh * | sort -h'
alias disks='df -h'

# Dotfiles
alias dotfiles='edit ~/dotfiles'

# Mac
alias noidle='pmset noidle &'
function idle {
	ps aux | grep noidle | awk '{print $2}' | while read in; do echo "$in"; done;
}
function slp {
	if [ "$1" == "-f" ] || [ "$1" == "--force" ]; then
		osascript -e 'tell application "System Events" to sleep'
	else
		osascript -e 'tell application "Finder" to sleep'
	fi
}
