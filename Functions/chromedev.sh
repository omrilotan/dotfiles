function chromedev {
	if [[ "$1" = "--help" || "$1" = "-h" ]]; then
		echo -e "
chromedev: open a Chrome instance with a non secure address which is allowed secure operations
‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
If you do not pass an address - this script will request for one

address [address]

> Examples:
$ address http://127.0.0.1:3000
$ address
"
		return
	fi

	echo "Gonna open a Chrome instance with a non secure address which is allowed secure operations"

	addr=$1
	if [ -z "$addr" ]; then
		echo -e "Base address [http://localhost:1337]"
		read addr
		: ${addr:="http://localhost:1337"}
	fi

	/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --unsafely-treat-insecure-origin-as-secure=$addr
}
