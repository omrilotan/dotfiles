# Remove native installed nodejs
# sudo rm -rf /usr/local/{lib/node{,/.npm,_modules},bin,share/man}/{npm*,node*,man1/node*}
# brew uninstall --force node

export NVM_DIR="$HOME/.nvm"

function load_nvm {
	source "$NVM_DIR/nvm.sh"
	if [[ ! -f "$HOME/dotfiles/.npm_completion.sh" ]]; then
		npm completion >> ~/dotfiles/.npm_completion.sh
	fi
	source ~/dotfiles/.npm_completion.sh
}

if [ -f ".nvmrc" ]; then
	# Load NVM if needed
	load_nvm
	unset -f load_nvm
else
	# Set up idem potent NVM loaders
	nodecommands=(nvm npm npx node fssh)
	function nvm_load {
		# Unset all node command decorators
		for nodecommand in "${nodecommands[@]}"; do
			eval "unset -f ${nodecommand}"
		done
		unset -f nvm_load
		if [[ -s "$NVM_DIR/nvm.sh" ]]; then
			START=$(date +%s)
			load_nvm
			unset -f load_nvm
			END=$(date +%s)
			DIFF=$(echo "($END - $START)" | bc)
			echo -e "\033[0;94mLoading NVM took ${DIFF} seconds\033[0m"
		else
			echo "Can't find nvm script"
		fi
	}
	# All node commands should load NVM first
	for nodecommand in "${nodecommands[@]}"; do
		eval "function ${nodecommand} { nvm_load; ${nodecommand} \$@; }"
	done
fi

export NPMRC=$(cat ~/.npmrc) # For docker images etc.

# Include globally installed NPM packages from default version on NVM
NVMBIN="$NVM_DIR/versions/node/$(cat $NVM_DIR/alias/default)/bin"
export PATH="$PATH:$NVMBIN"
