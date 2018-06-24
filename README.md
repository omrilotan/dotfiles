# My Dotfiles

This is running with Bash on a Mac

## Installation
```sh
cd ~/.dotfiles

./setup.sh
```

### What just happened?
`.bash_profile` and `.gitconfig` files have been symlinked

The call to `~/.dotfiles/init.sh` has been added to `.bash_profile` if it isn't already there.

`.dotfiles` directory holds all subsequent settings. This helps visibility.


## This repository's structure
Files in the repo are **opt in**. Meaning everything is gitignored by default.

the file `custom.sh` is not opted in (ignored) but is called on if it exists. This file is the gateway to all private things.
