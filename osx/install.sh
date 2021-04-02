# Installling homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install findutils
brew install gnu-sed
brew install emacs
brew install awscli
brew install pgcli
brew install postgresql
brew install aws-okta
brew install jq
brew install --cask iterm2
brew install --cask alfred
brew install --cask visual-studio-code
brew install --cask sublime-text
brew install --cask 1password

# Increase key repeat
defaults write -g InitialKeyRepeat -int 13
defaults write -g KeyRepeat -int 1
