# My Dotfiles

This is running with Bash on a Mac


## This repository's structure

`dotfiles` directory holds all subsequent settings. This helps visibility.

The entry point is `~/dotfiles/init.sh`. It holds the list of files to load.
all `.sh` files under the directories `programs` and `custom` (that one's yours) will be loaded as well.

Each entry is measured to create visibility of startup cost.

<img src="./dotfiles.gif" style="width:383px;height:383px;background:black;">

Files in the repo are **opt in**. Meaning everything is gitignored by default.

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
