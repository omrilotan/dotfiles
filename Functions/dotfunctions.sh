function reload {
	clear
	source ~/dotfiles/init.sh
}

function bins {
	ls -l ~/dotfiles/node_modules/.bin | awk '{print $9}'
}

# Cross-shell prompted read (bash's `read -p` reads from a coprocess in zsh)
function ask {
	local __var=$1
	shift
	if [ -n "$ZSH_VERSION" ]; then
		read -r "${__var}?$*"
	else
		read -r -p "$*" "${__var}"
	fi
}

# Cross-shell single-keypress prompted read (bash's `read -n`, zsh's `read -k`)
function ask1 {
	local __var=$1
	shift
	if [ -n "$ZSH_VERSION" ]; then
		read -r -k 1 "${__var}?$*"
	else
		read -r -n 1 -p "$*" "${__var}"
	fi
}
