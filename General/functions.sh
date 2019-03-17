function name {
	[ $# -eq 0 ] && title="$(pwd | rev | cut -d/ -f1 | rev)" || title="$*"
	echo -ne "\033]0;"$title"\007"
}
alias n=name
n

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
	if [ -z "$1" ]; then
		echo "Please enter file path"
	else
		mkdir -p $( dirname "$1") && touch "$1"
	fi
}

function headers {
	curl $1 -svo /dev/null 2>&1 | grep ^\<
}

function envsize {
	expr length "$(env)"
	if [ "$?" == "0" ]; then
		env > /tmp/__env__
		wc -c < /tmp/__env__
		rm /tmp/__env__
	fi
}

function path_dedup {
	nvm use default
	local PREV_LENGTH=$(expr length "$PATH")
	export PATH=$(node -p "Array.from(new Set(process.env.PATH.split(':'))).join(':')")
	local CURR_LENGTH=$(expr length "$PATH")
	if [[ $PREV_LENGTH == $CURR_LENGTH ]]; then
		echo "PATH has no duplicates"
	else
		echo "Compacted PATH variable from $PREV_LENGTH to $CURR_LENGTH characters"
	fi
}

function google {
	open "https://www.google.com/?q=$*"
}

function youtube {
	open "https://www.youtube.com/results?search_query=$*"
}
