function name {
	[ $# -eq 0 ] && title="$(pwd | rev | cut -d/ -f1 | rev)" || title="$*"
	echo -ne "\033]0;"$title"\007"
}
alias n=name
