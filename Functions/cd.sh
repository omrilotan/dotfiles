function cd? {
	if [[ "$1" = "--help" || "$1" = "-h" ]]; then
		echo -e "
cd?: Change to the first directory which contains the string you pass
‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

cd? partial_directory_name

> Examples:
$ cd? modules
"
		return
	fi

	local q=${@%/}
	if [ -z $q ]; then
		echo "Please add a query"
		return 0
	fi
	set -- $(ls -a | grep $q --fixed-strings)
	if [ ! -z $1 ]; then
		# echo "Change Directory to $1"
		cd $1
		return 0
	fi
	# echo "Did not find $q"
}
