#! /usr/bin/env bash

set -o errexit
set -o errtrace
set -o pipefail

name="${1}"

if [ -z "$name" ]
then
  printf "You are awesome!\n"
else
  printf "Hello %s, you are awesome!\n" "${name}"
fi