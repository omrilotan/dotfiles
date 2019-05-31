[[ -s "$HOME/dotfiles/.bash_profile" ]] || ln -s ~/.bash_profile ~/dotfiles/.bash_profile
[[ -s "$HOME/dotfiles/.gitconfig" ]]    || ln -s ~/.gitconfig ~/dotfiles/.gitconfig
[[ -s "$HOME/dotfiles/hyper.js" ]]      || rm ~/.hyper.js
[[ -s "$HOME/dotfiles/hyper.js" ]]      || ln -s ~/dotfiles/hyper.js ~/.hyper.js
[[ -d "$HOME/dotfiles/.bin" ]] || [[ -d "$HOME/bin" ]] && ln -s ~/bin ~/dotfiles/.bin
[[ -s "$HOME/dotfiles/hosts" ]]         || ln -s /etc/hosts ~/dotfiles/hosts
[[ -s "$HOME/dotfiles/shells" ]]        || ln -s /etc/shells ~/dotfiles/shells
[[ -s "$HOME/dotfiles/.npmrc" ]]        || ln -s ~/.npmrc ~/dotfiles/.npmrc

[[ -z $(cat ~/.bash_profile | grep "dotfiles/init.sh") ]] && echo "source ~/dotfiles/init.sh" >> .bash_profile
