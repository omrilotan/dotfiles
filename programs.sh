# Git
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh

# Nodejs, NVM
[[ -s "$HOME/.nvm/nvm.sh" ]] && \. "$HOME/.nvm/nvm.sh"
export NPMRC=$(cat ~/.npmrc) # For docker images etc.

# Ruby, RVM
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Go
export PATH="$PATH:/usr/local/go/bin"

# SQLite
export PATH="$PATH:/usr/local/opt/sqlite/bin"

# OpenSSL
export PATH="/usr/local/opt/openssl/bin:$PATH"
