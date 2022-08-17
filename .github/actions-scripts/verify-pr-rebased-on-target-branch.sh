#!/usr/bin/env sh

# Script to check if feature branch in a PR is rebased on top of the
# target branch.
# Author: Ashish Ranjan

# Unofficial POSIX Shell Strict Mode
# https://gist.github.com/EvgenyOrekhov/5c1418f4710558b5d6717d9e69c6e929
set -o errexit
set -o nounset
IFS=$(printf '\n\t')

if [ -z "$GITHUB_BASE_REF" ]
then
      echo "\$GITHUB_BASE_REF env var not found"
      exit 1
fi

if [ -z "$GITHUB_HEAD_REF" ]
then
      echo "\$GITHUB_HEAD_REF env var not found"
      exit 1
fi

git fetch origin "$GITHUB_BASE_REF"
git fetch origin "$GITHUB_HEAD_REF"

commits=$(git log "origin/$GITHUB_HEAD_REF..origin/$GITHUB_BASE_REF")

if [ -n "$commits" ]
then
    echo "$GITHUB_HEAD_REF is not rebased on top of origin/$GITHUB_BASE_REF!"
    printf "Missing commits:\n\n"
    echo "$commits"
    exit 1
fi
