# General
alias l='ls -lahp'
alias q='exit'
alias copy=pbcopy
alias paste=pbpaste
alias now='date +%Y-%m-%d\ %H:%M'

# Dotfiles
alias reload='source ~/.dotfiles/init.sh'
alias dotfiles='sub ~/.dotfiles'

# network
alias ports='lsof -i -P | grep -i listen'
alias ip='ipconfig getifaddr en0'
alias flushcache='sudo dscacheutil -flushcache'
alias hosts='edit /etc/hosts'

# Editors
alias edit=sub
alias sub='/Applications/Sublime\ Text\.app/Contents/SharedSupport/bin/subl'
alias atom='/Applications/Atom.app/Contents/Resources/app/atom.sh'
alias github='/Applications/GitHub\ Desktop.app/Contents/Resources/app/static/github.sh open $(pwd)'

# Mac
alias bg='open /Library/Caches/com.apple.desktop.admin.png'

# fuck
eval "$(thefuck --alias)"
