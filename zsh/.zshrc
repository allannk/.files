#!/bin/zsh

bindkey -e

for i in $ZDOTDIR/zshrc.d/*; do
	source $i
done
