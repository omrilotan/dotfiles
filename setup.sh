#!/bin/bash

# Symlinks
q=()
q+=('("Bash profile" .bash_profile ~/.bash_profile)')
q+=('("Bash profile" .bashrc ~/.bashrc)')
q+=('("Git config" .gitconfig ~/.gitconfig)')
q+=('("VIM config" .vimrc ~/.vimrc)')
q+=('("Hosts file" hosts /etc/hosts)')
q+=('("Acceptable shells" shells /etc/shells)')
q+=('("Hyper config" .npmrc ~/.npmrc)')
q+=('("Terminalizer config" .terminalizer.yml ~/.terminalizer/config.yml)')
q+=('("Missing file" missing ~/.missing)')

for set in "${q[@]}";
do
	eval "parts=${set}"

	if [[ ! -s "$HOME/dotfiles/${parts[1]}" ]]; then
		if [[ -f ${parts[2]} ]]; then
			ln -s "${parts[2]}" "${parts[1]}"
			echo "created symlink for ${parts[0]}"
		fi
	fi
done

# Personal bin
if [[ ! -d "$HOME/dotfiles/.bin" ]]; then
	if [[ -d "$HOME/bin" ]]; then
		ln -s ~/bin ~/dotfiles/.bin
		echo "Created .bin symlink"
	fi
fi

# Node completion
node --completion-bash > ~/dotfiles/Programs/node-complete.sh

# This library's init
if [[ -z $(cat ~/.bash_profile | grep "dotfiles/init.sh") ]]; then
	echo "source ~/dotfiles/init.sh" >> .bash_profile
	echo "Added call to init to bash_profile"
fi

git config --global core.excludesfile ~/dotfiles/.gitignoreGlobal
