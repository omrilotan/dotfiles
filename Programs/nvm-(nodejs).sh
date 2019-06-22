# Remove native installed nodejs
# sudo rm -rf /usr/local/{lib/node{,/.npm,_modules},bin,share/man}/{npm*,node*,man1/node*}
# brew uninstall --force node

nodecommands=(nvm npm npx node)
function nvm_load {
	# Unset all node command decorators
	for nodecommand in "${nodecommands[@]}"; do
		eval "unset -f ${nodecommand}"
	done
	unset -f nvm_load
	if [[ -s "$HOME/.nvm/nvm.sh" ]]; then
		START=$(date +%s)
		echo "Loading NVM"
		source "$HOME/.nvm/nvm.sh"
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

export NPMRC=$(cat ~/.npmrc) # For docker images etc.

# Include globally installed NPM packages from default version on NVM
NVMBIN="$HOME/.nvm/versions/node/$(cat ~/.nvm/alias/default)/bin"
export PATH="$PATH:$NVMBIN"

# Package json access
alias scripts="cat package.json | jq '.scripts'"
alias deps="cat package.json | jq '.dependencies'"
alias devdeps="cat package.json | jq '.devDependencies'"
