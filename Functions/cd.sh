cd() {
	dir=$@
	: ${dir:=~}

	if [ -f "$1" ]; then
		echo "Change to the directory containing $(basename "$1")"
		dir=$(dirname "$1")
	fi

	# Change directory
	builtin cd "$dir" "${@:2}"

	if [ -f ".nvmrc" ]; then
		echo "Setup nodejs env"
		nvm use
	fi

	if [ -f ".ruby-version" ]; then
		echo "Setup ruby env"

		if [ -f ".ruby-gemset" ]; then
			rvm use "$(cat .ruby-version)@$(cat .ruby-gemset)"
		else
			rvm use $(cat .ruby-version)
		fi
	fi

	if [ -f ".python-version" ]; then
		echo "Using python version $(cat .python-version) with uv"
		uv venv
	fi

	if [ -d ".venv" ]; then
		echo "Activate python venv"
		source .venv/bin/activate
	fi
}

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
		echo "Change directory to $1"
		builtin cd $1
		return 0
	fi
	echo "Did not find directory $q"
}
