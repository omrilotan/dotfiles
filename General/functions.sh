function name {
	[ $# -eq 0 ] && title="$(pwd | rev | cut -d/ -f1 | rev)" || title="$*"
	echo -ne "\033]0;"$title"\007"
}
alias n=name
n

function dir {
	mkdir "$1"
	cd "$1"
}

function mkfile {
	if [ -z "$1" ]; then
		echo "Please enter file path"
	else
		mkdir -p $( dirname "$1") && touch "$1"
	fi
}

function google {
	open "https://www.google.com/?q=$*"
}
