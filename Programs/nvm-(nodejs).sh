function nvm {
	if [[ -s "$HOME/.nvm/nvm.sh" ]]; then
		source "$HOME/.nvm/nvm.sh"
		eval "nvm $@"
	else
		echo "Can't find nvm script"
	fi
}

export NPMRC=$(cat ~/.npmrc) # For docker images etc.
