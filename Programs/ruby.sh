# export PATH="$PATH:$HOME/.rvm/bin"
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Remove all locally installed gems
function rmgem {
	gem list | cut -d" " -f1 | xargs gem uninstall -aIx
}
