function py {
	case "$1" in
		"venv")
			if [ -d "venv" ]; then
				echo "found 'venv' directory. Activate"
				source venv/bin/activate
			else
				echo "Did not find 'venv' directory"
				echo "Use project python version $(pyenv local)"
				pyenv local $(pyenv local)
				echo "Set up virtualenv"
				virtualenv -p $(which python) venv
				echo "Activate virtualenv"
				source venv/bin/activate
				echo "Install requirements"
				pip install -r requirements.txt
			fi
			return
			;;

		"test")
			python -m pytest -vv -s
			return
			;;

		"style")
			pycodestyle . --max-line-length=119 --exclude venv
			return
			;;
	esac

	echo "Usage:
⎺⎺⎺⎺⎺⎺
$ py <argument>

Possible arguments:
⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺
venv) Set up virtual env in \"venv\" directory
test) Run pytest
style) Run pycodestyle"
}

