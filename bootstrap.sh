#!/usr/bin/env bash

# Mostly taken from https://github.com/mathiasbynens/dotfiles

# Get latest.
cd "$(dirname "${BASH_SOURCE}")";
git pull origin master;

function doIt() {
    rsync --exclude-from 'bootstrap-exclude.txt' -avh --no-perms . $HOME;
    source $HOME/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
	doIt;
    fi;
fi;

unset doIt;
