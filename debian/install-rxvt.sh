#!/bin/bash

apt-get install rxvt-unicode-256color

# TODO : set up .Xresources

# install urxvt-perls
curl -o /usr/lib/urxvt/perl/urxvt-perls.tar.gz https://codeload.github.com/muennich/urxvt-perls/tar.gz/2.2

cd /usr/lib/urxvt/perl
tar xf urxvt-perls.tar.gz

# clean up 
rm /usr/lib/urxvt/perl/urxvt-perls.tar.gz
