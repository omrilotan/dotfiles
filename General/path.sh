function path_dedup {
	START=$(($(date +%s%N)/1000000))
	echo "Looking for PATH duplicates"
	nvm use default
	local PREV_LENGTH=$(expr length "$PATH")
	export PATH=$(node -p "Array.from(new Set(process.env.PATH.split(':'))).join(':')")
	local CURR_LENGTH=$(expr length "$PATH")
	if [[ $PREV_LENGTH == $CURR_LENGTH ]]; then
		message="PATH has no duplicates ($CURR_LENGTH characters)"
	else
		message="Compacted PATH variable from $PREV_LENGTH to $CURR_LENGTH characters"
	fi
	END=$(($(date +%s%N)/1000000))
	DIFF=$(echo "$END - $START" | bc)
	echo -e "\\r${CHECK_MARK} $message \033[0;94m(${DIFF})\033[0m  "
}

# Personal bin files (symlinkes from ~/dotfiles/.bin)
export PATH="$PATH:$HOME/bin"

# Global node modules (across node versions)
export PATH="$PATH:$HOME/dotfiles/node_modules/.bin/"
