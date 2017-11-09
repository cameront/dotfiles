#!/usr/bin/env bash

echo "You should install (manually):"
echo "alfred 3"
echo "app cleaner"
echo "docker"
echo "sublime text 3"
echo "vlc"
echo "chrome"
echo "dropbox"
echo "jq"
echo "brew install gnu-sed gnu-grep --with-default-names"

exit 0

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew already installed."
fi

# Update homebrew recipes
brew update

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

binaries=(
  awscli
  python
  trash
  node
  tree
  git
  mercurial
)

echo "installing binaries..."
brew install ${binaries[@]}

echo "cleaning up..."
brew cleanup

echo "installing cask..."
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Apps
apps=(
  alfred
  appcleaner
  atom
  cloudup
  dockertoolbox
  dropbox
  google-chrome
  iterm2
  sublime-text3
  virtualbox
  vlc
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# Allow alfred to launch the applications above.
brew cask alfred link

DIR_NAME=$( dirname "${BASH_SOURCE[0]}" )
echo "setting osx defaults..."
source "$( dirname ${BASH_SOURCE[0]} )/../.defaults-osx"
