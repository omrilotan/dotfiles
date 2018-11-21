# 🍮 I come at the end of the meal
cd() {
	builtin cd "$1"
	if [ -f ".nvmrc" ]; then
		nvm use
	fi
}
