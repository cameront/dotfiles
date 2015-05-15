#!/usr/bin/env bash

# https://golang.org/doc/install/source

set -e

# Get
if [ ! -d "$HOME/src/go" ]; then
    echo "Getting go..."
    mkdir -p ~/src
    cd ~/src
    git clone https://go.googlesource.com/go
    cd go
else
    cd ~/src/go
fi

git checkout go1.4.1

# Build
cd src
./all.bash

# Install the additional go tools
go get golang.org/x/tools/cmd/...

# TODO -- set GOPATH and ROOT in .bash_profile