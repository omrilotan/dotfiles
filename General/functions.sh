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

function headers {
	curl $1 -svo /dev/null 2>&1 | grep ^\<
}

function envsize {
	expr length "$(env)"
	if [ "$?" != "0" ]; then
		env > /tmp/__env__
		wc -c < /tmp/__env__
		rm /tmp/__env__
	fi
}

function path_dedup {
	START=$(($(date +%s%N)/1000000))
	echo "Looking for PATH duplicates"
	nvm use default
	local PREV_LENGTH=$(expr length "$PATH")
	export PATH=$(node -p "Array.from(new Set(process.env.PATH.split(':'))).join(':')")
	local CURR_LENGTH=$(expr length "$PATH")
	if [[ $PREV_LENGTH == $CURR_LENGTH ]]; then
		message="PATH has no duplicates ($CURR_LENGTH characters)"
	else
		message="Compacted PATH variable from $PREV_LENGTH to $CURR_LENGTH characters"
	fi
	END=$(($(date +%s%N)/1000000))
	DIFF=$(echo "$END - $START" | bc)
	echo -e "\\r${CHECK_MARK} $message \033[0;94m(${DIFF})\033[0m  "
}

function google {
	'open "https://www.google.com/?q=$*"'
}

function youtube {
	open "https://www.youtube.com/results?search_query=$*"
}

# Example: dock node:lts-alpine [evil-node]
function dock {
	local image=$1
	local name=$2
	: ${name:="$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 32 | head -n 1)"}
	echo "Gonna run $image as $name"
	docker run -it -d --name $name $image
	docker exec -it $name bin/sh
	echo "Stopping $image, don't close this process"
	docker stop $name
	docker rm $name
}
