#!/usr/bin/env sh

# Script to check if PR Title is prefixed with a JIRA ticket.
# e.g. SM-440: Add TLS support in Kafka
# Author: Ashish Ranjan

# Unofficial POSIX Shell Strict Mode
# https://gist.github.com/EvgenyOrekhov/5c1418f4710558b5d6717d9e69c6e929
set -o errexit
set -o nounset
IFS=$(printf '\n\t')

if [ -z "$PR_TITLE" ]
then
      echo "PR title was not found"
      exit 1
fi

echo "$PR_TITLE" | awk '/^[A-Z]{2,9}-[0-9]{1,6}: .*/' | grep . > /dev/null
