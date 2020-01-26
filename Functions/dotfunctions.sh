function reload {
	clear
	source ~/dotfiles/init.sh
}

function bins {
	ls -l ~/dotfiles/node_modules/.bin | awk '{print $9}'
}
