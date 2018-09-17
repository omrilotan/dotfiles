function name {
	[ $# -eq 0 ] && title="$(pwd | rev | cut -d/ -f1 | rev)" || title="$*"
	echo -ne "\033]0;"$title"\007"
}

function dir {
	mkdir "$1"
	cd "$1"
}

function google {
	open "https://www.google.com/?q=$*"
}

# function bundle {
# 	open "https://bundlephobia.com/result?p=$*"
# }

function sitespeed {
	if [ -z "$1" ]; then
		echo "Please enter a URL"
	else
		docker run --shm-size=1g --rm -v "$(pwd)":/sitespeed.io sitespeedio/sitespeed.io-autobuild:latest $1
	fi
}
