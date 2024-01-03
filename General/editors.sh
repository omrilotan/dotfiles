alias sub='/Applications/Sublime\ Text\.app/Contents/SharedSupport/bin/subl'
function subedit {
	sub /Users/omri\.lotan/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
}
alias atom='/Applications/Atom.app/Contents/Resources/app/atom.sh'
alias code='/Applications/Visual\ Studio\ Code\ -\ Insiders.app/Contents/Resources/app/bin/code'
# alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
# alias code='/Applications/Visual\ Studio\ \(Preview\).app/Contents/MacOs/VisualStudio'
alias github='/Applications/GitHub\ Desktop.app/Contents/Resources/app/static/github.sh open $(pwd)$@'

alias edit=code
export EDITOR=sub

function work {
	edit .
	git pull origin master
	name
}
