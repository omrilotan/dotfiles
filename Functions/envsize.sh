function envsize {
	if [[ "$1" = "--help" || "$1" = "-h" ]]; then
		echo -e "
envsize: measure the size of your env
‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

> Does not accept arguments
$ envsize
"
		return
	fi

	expr length "$(env)"
	if [ "$?" != "0" ]; then
		env > /tmp/__env__
		wc -c < /tmp/__env__
		rm /tmp/__env__
	fi
}
