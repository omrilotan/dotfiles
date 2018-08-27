# My Dotfiles

This is running with Bash on a Mac

## Installation
```sh
cd ~
git clone <REPO>
cd dotfiles
./setup.sh
```

### What just happened?
- Everything under `~/dotfiles` directory.
- `.bash_profile` and `.gitconfig` files have been symlinked in.
- The call to `~/dotfiles/init.sh` has been added to `.bash_profile` if it isn't already there.

`dotfiles` directory holds all subsequent settings. This helps visibility.

<img src="https://user-images.githubusercontent.com/516342/41821912-4f8ed2e8-77f0-11e8-9945-01be80e912bf.gif" width="300px">

## This repository's structure
Files in the repo are **opt in**. Meaning everything is gitignored by default.

the file `custom.sh` is not opted in (ignored) but is called on if it exists. This file is the gateway to all private things.
