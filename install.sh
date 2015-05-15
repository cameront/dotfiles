#!/bin/bash

# Installs the common ish, and then calls the appropriate os-specific installer.

set -e

echo ''

info () {
  printf "  [ \033[00;34m..\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

if [ "$(uname -s)" == "Darwin" ]
then
  info "installing OSX dependencies..."
  OS_SCRIPT="installs/install-osx.sh"
elif [ "$(uname --kernel-name)" == "Linux" ]
then 
  info "installing Linux dependencies..."
  OS_SCRIPT="installs/install-linux.sh"
fi

if [ -z "$OS_DOTFILE" ]
then
  fail "Unknown OS. Stopping."
else
  if ./$OS_DOTFILE
  then
    success "OS-specific dependencies installed"
  else
    fail "error installing OS-specific dependencies"
  fi
fi

./installs/install-common.sh
