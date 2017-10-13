#!/bin/bash

echo 'Installing Arc'

echo 'Adding arc dnf repo'
dnf config-manager --add-repo http://download.opensuse.org/repositories/home:Horst3180/Fedora_24/home:Horst3180.repo

echo 'dnf installing arc-theme'
dnf -y install arc-theme
