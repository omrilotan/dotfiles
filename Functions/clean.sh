function clean {
	if [ "$1" == "npx" ]; then
		echo "Cleaning npx cache"
		rm -rf ~/.npm/_npx
	fi

	echo "Please provide a valid argument (npx)"
}
