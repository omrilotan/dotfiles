alias sub='/Applications/Sublime\ Text\.app/Contents/SharedSupport/bin/subl'
function subedit {
	sub /Users/omri\.lotan/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
}
alias atom='/Applications/Atom.app/Contents/Resources/app/atom.sh'
# alias vscode='/Applications/Visual\ Studio\ Code\ -\ Insiders.app/Contents/Resources/app/bin/code'
alias vscode='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
alias github='/Applications/GitHub\ Desktop.app/Contents/Resources/app/static/github.sh open $(pwd)$@'

function code {
	local original=$@
	local q=${@%/}
	if [ -z $q ]; then
		vscode $@
		return 0
	fi
	if [ -d $q ]; then
		vscode $q
		return 0
	fi
	set -- $(ls -a | grep $q --fixed-strings)
	if [ ! -z $1 ]; then
		vscode $1
		return 0
	fi
	vscode $original
}

alias edit='code'

function work {
	code .
	git pull origin master
	name
}
