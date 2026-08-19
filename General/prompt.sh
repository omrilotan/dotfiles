GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=true
GIT_PS1_STATESEPARATOR=' '
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_DESCRIBE_STYLE=default
GIT_PS1_HIDE_IF_PWD_IGNORED=false

# \n - New line
# \! - History number
# \d – Current date
# \D{fmt} – Custom date formats (man strftime)
# \D{%c} - Datetime in current locale
# \t – Current time
# \H – Hostname
# \h – Short hostname
# \# – Command number
# \u – User name
# \W – Current working directory (ie: Desktop/)
# \w – Current working directory with full path (ie: /Users/Admin/Desktop/)
# \s - Shell name
# \v - Shell version
# \[..\] - Non-printed characters

# turquoise:
# green: \[\033[32m\]
# white: \[\033[00m\]
# blue:  \[\033[34m\]
# red:   \[\033[31m\]
# yellow: \[\033[33m\]
# yellow bold: \[\033[33;1m\]

emojis=(⚡️ 🚀 🏄 🍒 🍎 ✨ 🔥 🐛 🐌 👉 😶 🐛 ☕️ 📍 🏮 🎈 🛎 💡 ⚽️ 🍓 🥚 🍪 🍩 🍺 🍻 🌕 🌍 🌞 🌝 🍀 🦎 🦋 🦖 🦕 🧟‍♂️ 👉 👽 🤡 👾 🤙 ✊ 🤘 🧛 ⛄️ 🌼 🍄 ☘️ 🐲 ☁️ 🍬 💎 🎀 💬 💭 🔔)

if [ -n "$ZSH_VERSION" ]; then
	autoload -Uz vcs_info
	zstyle ':vcs_info:git:*' formats '%b'
	precmd_functions+=(vcs_info)
fi

function icon {
	if [ -z "$1" ]; then
		if [ -n "$ZSH_VERSION" ]; then
			# zsh arrays are 1-indexed
			face=${emojis[$((RANDOM % ${#emojis[@]} + 1))]}
		else
			RANDOM=$$$(date +%s)
			face=${emojis[$RANDOM % ${#emojis[@]} ]}
		fi
	else
		face="$1"
	fi

	if [ -n "$ZSH_VERSION" ]; then
		export PROMPT='%F{red}%D{%H:%M}%f %F{green}%1~%f%F{yellow}${vcs_info_msg_0_:+ (${vcs_info_msg_0_})}%f ${face} '
	else
		export PS1='\[\033[31m\]\D{%H:%M}\[\033[33m\] \[\033[32m\]\W\[\033[33m\]$(__git_ps1)\[\033[00m\] ${face} '
	fi
}
icon

# if [ $ITERM_SESSION_ID ]; then
#   export PROMPT_COMMAND='icon; ':"$PROMPT_COMMAND";
# fi
