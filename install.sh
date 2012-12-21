#!/bin/bash

# go home
cd ~

# fetch sources
git clone https://github.com/alternatex/bazinga.git .bazingax

# shell configuration file (TODO: combine with $SHELL environment variable)
shellcfg=""

# BASH
if [ -f ~/.bashrc ]; then 
	shellcfg="$HOME/.bashrc"
fi

# ZSH
if [ -f ~/.zshrc ]; then 
	shellcfg="$HOME/.zshrc"
fi

# ?
if [ -f ~/.profile ]; then 
	shellcfg="$HOME/.profile"
fi

# update shell configuration
echo "# bazinga" >> $shellcfg
echo "export PATH=~/.bazingax/bin:$PATH" >> $shellcfg

# apply 
. $shellcfg