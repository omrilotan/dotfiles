function sublime {
	'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' "$@"
}
function vscode {
	'/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code' "$@"
}
function cursorcode {
	'/Applications/Cursor.app/Contents/Resources/app/bin/code' "$@"
}
alias github='/Applications/GitHub\ Desktop.app/Contents/Resources/app/static/github.sh open $(pwd)$@'

function _editor_open {
	local selected_editor=$1
	shift
	local original=$@
	local q=${@%/}
	if [ -z $q ]; then
		$selected_editor $@
		return 0
	fi
	if [ -d $q ]; then
		$selected_editor $q
		return 0
	fi
	set -- $(ls -a | grep $q --fixed-strings)
	if [ ! -z $1 ]; then
		$selected_editor $1
		return 0
	fi
	$selected_editor $original
}

function code {
	_editor_open vscode "$@"
}

function cursor {
	_editor_open cursorcode "$@"
}

function sub {
	if [ "$1" = "config" ]; then
		sublime /Users/omri\.lotan/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
		return 0
	fi
	_editor_open sublime "$@"
}

## Chosen editor
function edit {
	_editor_open vscode "$@"
}

function work {
	edit .
	git pull origin master
	name
}
