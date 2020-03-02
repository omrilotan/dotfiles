# 🍮 I come at the end of the meal
cd() {
	dir=$@
	: ${dir:=~}

	builtin cd "$dir"
	if [ -f ".nvmrc" ]; then
		nvm use
	fi

	if [ -f ".ruby-version" ]; then
		if [ -f ".ruby-gemset" ]; then
			rvm use "$(cat .ruby-version)@$(cat .ruby-gemset)"
		else
			rvm use $(cat .ruby-version)
		fi
	fi

	if [ -f ".python-version" ]; then
		pyenv local $(pyenv local)
	fi
}

c() {
	dir=$@
	: ${dir:=~}

	builtin cd "$dir"
}
