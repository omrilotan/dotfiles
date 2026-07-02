function py {
	case "$1" in
	  ## venv) Set up virtual env in \"venv\" directory
		#
		# "venv")
		# 	if [ -d "venv" ]; then
		# 		echo "found 'venv' directory. Activate"
		# 		source venv/bin/activate
		# 	else
		# 		echo "Did not find 'venv' directory"
		# 		echo "Use project python version from .python-version"
		# 		uv python pin "$(cat .python-version)"
		# 		echo "Set up virtualenv"
		# 		virtualenv -p $(which python) venv
		# 		# eval "$(which python) -m pip install virtualenv"
		# 		# /Library/Frameworks/Python.framework/Versions/Current/bin/virtualenv -p $(which python) venv

		# 		echo "Activate virtualenv"
		# 		source venv/bin/activate
		# 		if [ -f "requirements.txt" ]; then
		# 			echo "Install requirements"
		# 			pip install -r requirements.txt
		# 		fi
		# 	fi
		# 	return
		# 	;;

		"test")
			python -m pytest -vv -s
			return
			;;

		"style")
			pycodestyle . --max-line-length=119 --exclude venv
			return
			;;

    ## freeze) save requirements
		#
		# "freeze")
		# 	pip freeze > requirements.txt
		# 	return
		# 	;;

		"list")
			if ! command -v uv >/dev/null 2>&1; then
				echo "uv is not installed"
				return 1
			fi

			echo $(uv python list --only-installed 2>/dev/null | awk 'NF {print $1}')
			return
			;;

		"hop")
			if ! command -v uv >/dev/null 2>&1; then
				echo "uv is not installed"
				return 1
			fi

			versions=$(uv python list --only-installed 2>/dev/null | awk 'NF {print $1}')
			if [ -z "$versions" ]; then
				echo "No installed Python versions found via uv"
				return 1
			fi

			select version in $versions;
			do
				if [ -z "$version" ]; then
					echo "Invalid selection"
					continue
				fi

				uv python pin "$version"
				python -V
				break
			done
			return
			;;
		"pip")
			python -m ensurepip --upgrade
			return
			;;
		"requirements")
			if [ -f "requirements.txt" ]; then
				echo "Install requirements"
				python -m pip install -r requirements.txt
			else
				echo "No requirements.txt found"
			fi
			return
			;;
	esac

	echo "Usage:
⎺⎺⎺⎺⎺⎺
$ py <argument>

Possible arguments:
⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺
test) Run pytest
style) Run pycodestyle
list) list available versions
hop) change versions using uv (pins .python-version)
pip) upgrade pip
requirements) install requirements from requirements.txt"
}

