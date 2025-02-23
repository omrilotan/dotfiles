LOADING="⏳"
CHECK_MARK="\033[0;32m\xE2\x9C\x94\033[0m"
POST_INIT="pudding"

# reset path
export PATH=""
export PATH="$PATH:/bin"
export PATH="$PATH:/sbin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/usr/local/"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/local/sbin"

# Apple
export PATH="$PATH:PATH=/usr/local/jamf/bin"

# Specific locations
export PATH="$PATH:/usr/X11/bin"

# Homebrew
export PATH="$PATH:/opt/homebrew/bin/"

# Personal bin files (symlinkes from ~/dotfiles/.bin)
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/dotfiles/.executables"

# Global node modules (across node versions)
export PATH="$PATH:$HOME/dotfiles/node_modules/.bin/"

directories=($(ls -d ~/dotfiles/*/ | grep -v node_modules))

# `brew install coreutils` - milliseconds support in date is required. Using gnu date (gdate)
export PATH="$PATH:/usr/local/opt/coreutils/libexec/gnubin"
export PATH="$PATH:/opt/homebrew/opt/gnu-tar/libexec/gnubin"

command -v gdate >/dev/null 2>&1 || { echo >&2 "Requires gnu date (gdate) to work. Aborting. Run 'brew install coreutils'"; exit 1; }
# alias date=gdate

STARTALL=$(gdate +%s)

for directory in "${directories[@]}"; do
	echo -e "\033[0;33m${directory##*dotfiles/}\033[0m"
	for f in ${directory}*.sh; do
		base="$(basename $f .sh)"
		echo -n "$LOADING $base"
		START=$(($(gdate +%s%N)/1000000))
		source $f
		END=$(($(gdate +%s%N)/1000000))
		DIFF=$(echo "$END - $START" | bc)
		echo -e "\\r${CHECK_MARK} $base \033[0;94m(${DIFF})\033[0m  "
	done
done

echo -e "\033[0;33m🍮  ${POST_INIT}\033[0m"
echo -n "$LOADING $POST_INIT"
START=$(($(gdate +%s%N)/1000000))
source ~/dotfiles/${POST_INIT}.sh
END=$(($(gdate +%s%N)/1000000))
DIFF=$(echo "$END - $START" | bc)
echo -e "\\r${CHECK_MARK} ${POST_INIT} \033[0;94m(${DIFF})\033[0m  "

ENDALL=$(gdate +%s)
DIFFALL=$(echo "($ENDALL - $STARTALL)" | bc)
echo -e "\033[0;94mEverything took ${DIFFALL} seconds\033[0m"

cd .
name
