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

	local engines=()
	engines+=('google (default)')
	engines+=('youtube')
	engines+=('youtube-music')
	engines+=('github')
	engines+=('npm')
	select engine in "${engines[@]}";
	do
		case "$engine" in
			youtube)
				open "https://www.youtube.com/results?search_query=$*";
				break;
				;;
			youtube-music)
				open "https://music.youtube.com/search?q=$*";
				break;
				;;
			github)
				open "https://github.com/search?q=$*";
				break;
				;;
			npm)
				open "https://www.npmjs.com/search?q=$*";
				break;
				;;
			*)
				open "https://www.google.com/?q=$*";
				break;
				;;
		esac
	done
}
