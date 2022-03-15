export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export CFLAGS="-Wno-error=implicit-function-declaration"
export optflags="-Wno-error=implicit-function-declaration"
export RUBY_CONFIGURE_OPTS='--with-readline-dir=/usr/local/opt/readline/'
export RUBY_CFLAGS=-DUSE_FFI_CLOSURE_ALLOC

# export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"
# export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.0/lib/pkgconfig"

export PATH="/opt/homebrew/opt/openssl@1.0/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl@1.0/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.0/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.0/lib/pkgconfig"

# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

# Remove all locally installed gems
function rmgem {
	gem list | cut -d" " -f1 | xargs gem uninstall -aIx
}


# --with-openssl-dir='/usr/local/opt/openssl'
# --with-openssl-dir=/opt/homebrew/opt/openssl@1.0
# --with-openssl-dir=/opt/homebrew/opt/openssl@1.1
