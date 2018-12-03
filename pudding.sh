# 🍮 I come at the end of the meal
cd() {
	dir=$1
	: ${dir:=~}

	builtin cd $dir
	if [ -f ".nvmrc" ]; then
		nvm use
	fi
}
