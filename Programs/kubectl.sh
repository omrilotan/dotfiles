if command -v kubectl &> /dev/null
then
	if [ -n "$ZSH_VERSION" ]; then
		source <(kubectl completion zsh)
	else
		source <(kubectl completion bash)
	fi
fi
