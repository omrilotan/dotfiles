if [[ $(basename $SHELL) == "bash" ]]; then
	bind 'set completion-ignore-case on'
	[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
fi
