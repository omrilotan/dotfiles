# 🍮 I come at the end of the meal
cd() {
	dir=$@
	: ${dir:=~}

	builtin cd "$dir"
	if [ -f ".nvmrc" ]; then
		echo "Setup nodejs env"
		nvm use
	fi

	if [ -f ".ruby-version" ]; then
		echo "Setup ruby env"

		# rubyver=$(rbenv local)
		# rbenv local ${rubyver#ruby-}

		if [ -f ".ruby-gemset" ]; then
			rvm use "$(cat .ruby-version)@$(cat .ruby-gemset)"
		else
			rvm use $(cat .ruby-version)
		fi
	fi

	if [ -f ".python-version" ]; then
		echo "Setup python env"
		command -v && eval "$(pyenv init -)"

		echo "Using python version $(cat .python-version)"
		pyenv local $(pyenv local)
	fi
}

c() {
	dir=$@
	: ${dir:=~}

	builtin cd "$dir"
}
