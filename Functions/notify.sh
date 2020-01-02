function notify {
	if [[ "$1" = "--help" || "$1" = "-h" ]]; then
		echo -e "
notify: Send a tray notification
‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
All arguments will be turned into a sentence to pop as tray notification

notify [...args]

> Examples:
$ npm i && notify finished install on \$(basename \$(pwd))
$ notify remember to stretch | at now + 45 minutes
"
		return
	fi

	osascript -e "display notification \"${*}\" with title \"You asked my to remind you:\""
}
