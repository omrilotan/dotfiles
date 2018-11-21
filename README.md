# My Dotfiles

This is running with Bash on a Mac


## This repository's structure

`dotfiles` directory holds all subsequent settings. This helps visibility.

The entry point is `~/dotfiles/init.sh`. It finds all nested directories and parses all `.sh` files under each of those directories. Only 'General' and 'Programs' are **not** gitignored, so add more directories to put your private things in.

> \* Files in the repo are **opt in**. Meaning everything is gitignored by default.

Each entry is measured to create visibility of startup cost.

<img src="./dotfiles.gif" style="width:480px;">

## Installation
```sh
cd ~
git clone <REPO>
cd dotfiles
./setup.sh
```

> #### What just happened?
> - Everything is under `~/dotfiles` directory.
> - The call to `~/dotfiles/init.sh` has been added to `.bash_profile` if it isn't already there.
> - `.bash_profile` and `.gitconfig` files have been symlinked in.
> - `hyper.js` (if exists) has been symlinked out.


### Requirements
`brew install coreutils` - milliseconds support in date is required. I'm gnu date (gdate)
