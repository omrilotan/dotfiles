function tab() {
  TAB_NAME=$1
  COMMAND=$2
  osascript \
    -e "tell application \"Terminal\"" \
    -e "tell application \"System Events\" to keystroke \"t\" using {command down}" \
    -e "do script \"printf '\\\e]1;$TAB_NAME\\\a'; $COMMAND\" in front window" \
    -e "end tell" > /dev/null
}

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

function sitespeed {
	if [ -z "$1" ]; then
    echo "Please enter a URL"
  else
    docker run --shm-size=1g --rm -v "$(pwd)":/sitespeed.io sitespeedio/sitespeed.io-autobuild:latest $1
	fi
}
