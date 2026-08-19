if [ -n "$BASH_VERSION" ]; then
	bind 'set completion-ignore-case on'
	[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
fi

export HISTTIMEFORMAT="%F %T "
export BASH_SILENCE_DEPRECATION_WARNING=1
