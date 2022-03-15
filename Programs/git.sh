[ -f /usr/local/git/contrib/completion/git-completion.bash ] && source /usr/local/git/contrib/completion/git-completion.bash
[ -f /usr/local/git/contrib/completion/git-prompt.sh ] && source /usr/local/git/contrib/completion/git-prompt.sh

function get {
	repo="$@"
	directory="$(basename $repo)"
	directory=${directory%.*}
	git clone $repo --recurse-submodules --remote-submodules
	cd $directory
	n
}
