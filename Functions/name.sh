function name {
	local title

	if [ $# -ne 0 ]
	then
		title="$*"
	fi

	is_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"

	if [[ -z ${title} ]]
	then
		if [ "$inside_git_repo" == "true" ]
		then
			title=$(basename `git rev-parse --show-toplevel`)
		fi
	fi

	if [[ -z ${title} ]]
	then
		title="$(pwd | rev | cut -d/ -f1 | rev)"
	fi

	echo -ne "\033]0;"$title"\007"
}
alias n=name
