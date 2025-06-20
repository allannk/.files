#!/bin/zsh

for i in $ZDOTDIR/zshrc.d/*; do
	source $i
done
