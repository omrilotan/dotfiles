[[ -s "$HOME/.dotfiles/.bash_profile" ]] || ln -s ~/.bash_profile ~/.dotfiles/.bash_profile
[[ -s "$HOME/.dotfiles/.gitconfig" ]]    || ln -s ~/.gitconfig ~/.dotfiles/.gitconfig

[[ -z $(cat ~/.bash_profile | grep "dotfiles/init.sh") ]] && echo "source ~/.dotfiles/init.sh" >> .bash_profile
