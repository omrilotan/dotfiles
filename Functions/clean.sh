function clean {
	if [ "$1" == "npx" ]; then
		echo "Cleaning npx cache"
		rm -rf ~/.npm/_npx
		exit 0
	fi

	echo "Please provide a valid argument"
	exit 1
}
