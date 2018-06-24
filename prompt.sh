GIT_PS1_SHOWDIRTYSTATE=true
bind 'set completion-ignore-case on'
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# \d – Current date
# \t – Current time
# \h – Host name
# \# – Command number
# \u – User name
# \W – Current working directory (ie: Desktop/)
# \w – Current working directory with full path (ie: /Users/Admin/Desktop/)

# turquoise:
# green: \[\033[32m\]
# white: \[\033[00m\]
# blue:  \[\033[34m\]
# red:   \[\033[31m\]
# yellow: \[\033[33m\]
# yellow bold: \[\033[33;1m\]

emojis=(⚡️ ➙ ➠ ☞ ➪ ➲ ☛ ⇉ ➘ ⬊ ↪︎ ➤ ✂︎ ✏︎︎ ☕︎ ✈︎ 🚀 🏄 🍒 🍎 ✨ 🔥 🐛 🐌 👉 😶)
RANDOM=$$$(date +%s)
face=${emojis[$RANDOM % ${#emojis[@]} ]}

export PS1='\[\033[32m\]\w\[\033[33m\]$(__git_ps1)\[\033[00m\] ${face} '
