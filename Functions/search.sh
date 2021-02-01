function search {
	if [[ "$1" = "--help" || "$1" = "-h" ]]; then
		echo -e "
search: Search the interwebs
‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
Search first - decide where to search later

search [...search term]

> Examples:
$ search
$ search anything you want
"
		return
	fi

	local term=$*
	if [ -z "$term" ]; then
		read  -p 'Search for: ' term
	fi

	echo """Select search engine:
‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
1) google (default)
2) youtube
3) youtube-music
4) github
5) npm
	"""
	read engine
	case "$engine" in
		1|"")
			open "https://www.google.com/search?q=$*";
			;;
		2|youtube)
			open "https://www.youtube.com/results?search_query=$*";
			;;
		3|youtube-music)
			open "https://music.youtube.com/search?q=$*";
			;;
		4|github)
			open "https://github.com/search?q=$*";
			;;
		5|npm)
			open "https://www.npmjs.com/search?q=$*";
			;;
		*)
			open "https://www.google.com/search?q=$*";
			;;
	esac
}
