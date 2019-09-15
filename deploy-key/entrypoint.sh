#!/usr/bin/env sh

set -eo pipefail

if [ -z "$1" ]; then
  >&2 echo 'FATAL: ssh-private-key is required'
  exit 1
fi

mkdir -p ~/.ssh

ssh-keyscan -t rsa github.com > ~/.ssh/known_hosts

echo "$1" > ~/.ssh/id_rsa

chmod 400 ~/.ssh/id_rsa
