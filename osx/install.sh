#!/bin/zsh

set -e

prompt_confirmation() {
    local name="$1"
    local cmd="$2"

    echo
    read -sk1 "choice?Press Y/y to $name... "
    if [[ "$choice" =~ ^[Yy]$ ]]; then
	echo
        eval ${cmd}
	echo "done ${name}"
    else
        echo
        echo "skipping install"
    fi
}


prompt_confirmation "install homebrew" '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'

prompt_confirmation "install findutils" 'brew install findutils'
prompt_confirmation "install gnu-sed" 'brew install gnu-sed'
prompt_confirmation "install emacs" 'brew install emacs'
prompt_confirmation "install awscli" 'brew install awscli'
prompt_confirmation "install jq" 'brew install jq'
prompt_confirmation "install go" 'brew install go'
prompt_confirmation "install nvm" 'brew install nvm'
prompt_confirmation "install iterm2" 'brew install --cask iterm2'
prompt_confirmation "install alfred" 'brew install --cask alfred'
prompt_confirmation "install vscode" 'brew install --cask visual-studio-code'
prompt_confirmation "install sublime text" 'brew install --cask sublime-text'

prompt_confirmation "set key repeat rate" 'defaults write -g InitialKeyRepeat -int 13 && defaults write -g KeyRepeat -int 1'

prompt_confirmation "move .zshrc from repo into home directory?" 'cp ~/.zshrc ~/.zshrc`date +%s`.bak && cp ./.zshrc ~/'
