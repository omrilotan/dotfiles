function mkcd {
	mkdir "$1"
	cd "$1"
}

function mkfile {
	mkdir -p $( dirname "$1") && touch "$1"
}
