#!/usr/bin/env bash

set -e

if [ ! -d "$HOME/google-cloud-sdk" ]
then
    curl https://sdk.cloud.google.com | bash
fi
