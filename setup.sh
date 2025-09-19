#!/bin/bash

# Symlinks
symlink_dir="$HOME/dotfiles/.symlinks"
q=()
q+=('("Bash profile" ${symlink_dir}/.bash_profile ~/.bash_profile)')
q+=('("Bash config" ${symlink_dir}/.bashrc ~/.bashrc)')
q+=('("Git config" ${symlink_dir}/.gitconfig ~/.gitconfig)')
q+=('("VIM config" ${symlink_dir}/.vimrc ~/.vimrc)')
q+=('("ngrok config" ${symlink_dir}/ngrok.yml ~/.ngrok2/ngrok.yml)')
q+=('("Hosts file" /etc/hosts ${symlink_dir}/hosts)')
q+=('("Acceptable shells" /etc/shells ${symlink_dir}/shells)')
q+=('("NPM config" ${symlink_dir}/.npmrc ~/.npmrc)')
q+=('("VS code MCP" ${symlink_dir}/.vscode_mcp.json ~/Library/Application\ Support/Code/User/mcp.json)')
mkdir -p "$symlink_dir"

for set in "${q[@]}";
do
	eval "parts=${set}"
	name="${parts[0]}"
	file="${parts[1]}"
	link="${parts[2]}"

	if [[ ! -f ${file} && ! -f ${link} ]]; then
		echo "✘ [${name}]: No files for ${name}, skip"
		continue
	fi
	if [[ -s ${file} && -f ${link} && "$(readlink "${link}")" != ${file} ]]; then
		echo "✘ [${name}]: Link ${file} exists but is not a symlink to ${link}, Please check manually"
		continue
	fi
	if [[ ! -s ${file} && -f ${link} ]]; then
		echo "✔︎ [${name}]: Move file to symlink dir and replace original with symlink"
		mv "${link}" "${file}"
		ln -s "${file}" "${link}"
		continue
	fi
	if [[ -s ${file} && ! -f ${link} ]]; then
		echo "✔︎ [${name}]: Create symlink to existing file"
		ln -s "${file}" "${link}"
		continue
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
