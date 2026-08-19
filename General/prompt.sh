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

# Portable git status for the prompt: branch, staged (+), unstaged (✗), untracked (?), ahead (↑N), behind (↓N)
function _git_prompt_info {
	local branch ahead_behind ahead behind marks
	branch="$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)"
	[ -z "$branch" ] && return

	marks=""
	git diff --quiet --ignore-submodules 2>/dev/null || marks="${marks}✗"
	git diff --cached --quiet --ignore-submodules 2>/dev/null || marks="${marks}+"
	[ -n "$(git ls-files --others --exclude-standard 2>/dev/null)" ] && marks="${marks}?"

	ahead_behind="$(git rev-list --left-right --count '@{u}...HEAD' 2>/dev/null)"
	if [ -n "$ahead_behind" ]; then
		behind="${ahead_behind%%[[:space:]]*}"
		ahead="${ahead_behind##*[[:space:]]}"
		[ "$ahead" != "0" ] && marks="${marks}↑${ahead}"
		[ "$behind" != "0" ] && marks="${marks}↓${behind}"
	fi

	echo " (${branch}${marks:+ ${marks}})"
}

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
		export PROMPT='%F{red}%D{%H:%M}%f %F{green}%1~%f%F{yellow}$(_git_prompt_info)%f ${face} '
	else
		export PS1='\[\033[31m\]\D{%H:%M}\[\033[33m\] \[\033[32m\]\W\[\033[33m\]$(_git_prompt_info)\[\033[00m\] ${face} '
	fi
}
icon

# if [ $ITERM_SESSION_ID ]; then
#   export PROMPT_COMMAND='icon; ':"$PROMPT_COMMAND";
# fi
