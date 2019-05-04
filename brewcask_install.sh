#!/bin/bash

#Upgrade brew
brew update && brew upgrade

#Upgrade cask
for c in `brew cask list`; do ! brew cask info $c | grep -qF "Not installed" || brew cask install $c; done

brew cleanup

##Upgrade pip
pip3 list --outdated | cut -d " " -f 1 | grep -v "\--" | grep -v Package | xargs pip3 install -U
