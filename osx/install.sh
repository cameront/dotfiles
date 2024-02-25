
echo $SHELL

set -e

prompt_confirmation() {
    local name="$1"
    local cmd="$2"
    
    if [[ $(read -q "choice?Press Y/y to $1") ]]; then
        `($2)`
    else
        echo
        echo "skipping install"
    fi
}


prompt_confirmation "install findutils" 'brew install findutils'

exit 1

# Installling homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install findutils
brew install gnu-sed
brew install emacs
brew install awscli
brew install jq
brew install go
brew install nvm
brew install --cask iterm2
brew install --cask alfred
brew install --cask visual-studio-code
brew install --cask sublime-text


# Increase key repeat
defaults write -g InitialKeyRepeat -int 13
defaults write -g KeyRepeat -int 1
