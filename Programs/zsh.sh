if [ -n "$ZSH_VERSION" ]; then
	# bash's `bind 'set completion-ignore-case on'` equivalent
	zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
	setopt EXTENDED_HISTORY
fi
