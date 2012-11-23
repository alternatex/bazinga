#!/bin/bash

# go home
cd ~

# fetch sources
git clone https://github.com/alternatex/bazinga.git .bazingax

# update shell configuration
if [ -f ~/.zshrc ]; then 
	echo "# bazinga" >> ~/.zshrc
	echo "export PATH=~/.bazingax/bin:$PATH" >> ~/.zshrc
	. ~/.zshrc
fi

if [ -f ~/.bashrc ]; then 
	echo "# bazinga" >> ~/.bashrc
	echo "export PATH=~/.bazingax/bin:$PATH" >> ~/.bashrc
	. ~/.bashrc
fi

if [ -f ~/.profile ]; then 
	echo "# bazinga" >> ~/.profile
	echo "export PATH=~/.bazingax/bin:$PATH" >> ~/.profile
	. ~/.profile
fi