function reload {
	clear
	source ~/dotfiles/init.sh
}

function name {
	[ $# -eq 0 ] && title="$(pwd | rev | cut -d/ -f1 | rev)" || title="$*"
	echo -ne "\033]0;"$title"\007"
}
alias n=name

function work {
	edit .
	git pull origin master
	name
}

function mkcd {
	mkdir "$1"
	cd "$1"
}

function mkfile {
	mkdir -p $( dirname "$1") && touch "$1"
}

function bins {
	ls -l ~/dotfiles/node_modules/.bin | awk '{print $9}'
}
