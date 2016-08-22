#!/bin/bash

#Upgrade brew
brew update && brew upgrade

#Upgrade cask
for c in `brew cask list`; do ! brew cask info $c | grep -qF "Not installed" || brew cask install $c; done

brew cleanup
brew cask cleanup

##Upgrade pip
pip list --outdated | grep '^[a-z]* (' | cut -d " " -f 1 | xargs pip install -U
