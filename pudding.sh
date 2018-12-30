# 🍮 I come at the end of the meal
cd() {
	dir=$1
	: ${dir:=~}

	builtin cd $dir
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
}
