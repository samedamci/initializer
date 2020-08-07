#!/bin/sh

git init
git remote add origin "ssh://git@git.samedamci.com:8953/samedamci/${PWD##*/}.git"
git remote set-url --add origin "git@github.com:samedamci/${PWD##*/}.git"

case "$1" in
  python)
    mkdir "${PWD##*/}"
    virtualenv -p pypy3 .

    printf "%s\n" \
"bin/
lib/
site-packages/
__pycache__/
pyvenv.cfg
  " > .gitignore
esac
