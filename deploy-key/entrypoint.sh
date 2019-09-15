#!/usr/bin/env sh

set -eo pipefail

if [ -z "$1" ]; then
  >&2 echo 'FATAL: ssh-private-key is required'
  exit 1
fi

mkdir -p "$HOME/.ssh"

ssh-keyscan -t rsa github.com > "$HOME/.ssh/known_hosts"

echo "$1" > "$HOME/.ssh/id_rsa"

chmod 400 "$HOME/.ssh/id_rsa"
