#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

brew tap adoptopenjdk/openjdk

# install java 11
echo 'Installing java'
brew install adoptopenjdk11

# install gradle
echo 'Installing gradle'
mkdir -p $HOME/.gradle
touch $HOME/.gradle/gradle.properties
brew install gradle
