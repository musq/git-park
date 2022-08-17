#!/usr/bin/env sh

# Author: Ashish Ranjan

# Unofficial POSIX Shell Strict Mode
# https://gist.github.com/EvgenyOrekhov/5c1418f4710558b5d6717d9e69c6e929
set -o errexit
set -o nounset
IFS=$(printf '\n\t')


echo "---------"
echo "$PR_TITLE"
echo "---------"

if [ -z "$PR_TITLE" ]
then
      echo "PR title was not found"
      exit 1
fi
