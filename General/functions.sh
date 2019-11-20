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

# npm i && notify finished install on $(basename $(pwd))
function notify {
	osascript -e "display notification \"${*}\" with title \"You asked my to remind you:\""
}

function chromedev {
	echo "Gonna open a Chrome instance with a non secure address which is allowed secure operations"

	addr=$1
	if [ -z "$addr" ]; then
		echo -e "Base address [http://localhost:1337]"
		read addr
		: ${addr:="http://localhost:1337"}
	fi

	/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --unsafely-treat-insecure-origin-as-secure=$addr
}

function mkcd {
	mkdir "$1"
	cd "$1"
}

function mkfile {
	mkdir -p $( dirname "$1") && touch "$1"
}

function envsize {
	expr length "$(env)"
	if [ "$?" != "0" ]; then
		env > /tmp/__env__
		wc -c < /tmp/__env__
		rm /tmp/__env__
	fi
}

# Example: dock node:lts-alpine [evil-node]
function dock {
	local image=$1
	local name=$2
	: ${name:="dock${RANDOM}"}
	echo "Gonna run $image as $name"
	docker run -it -d --name $name $image
	docker exec -it $name bin/sh
	echo "Stopping $image, don't close this process"
	docker stop $name
	docker rm $name
}

function nodeocker {
	dock node:lts-slim nodeslim
}

function cd? {
	local q=$@
	if [ -z $q ]; then
		echo "Please add a query"
		return 0
	fi
	set -- $(ls -a | grep $q --fixed-strings)
	if [ ! -z $1 ]; then
		echo "Change Directory to $1"
		cd $1
		return 0
	fi
	echo "Did not find $q"
}
