# set some useful aliases
alias lsal='ls -al'
alias edit=subl

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export PATH=$PATH:~/bin:/usr/local/opt/go/libexec/bin

# set up the prompt
export PS1=$'\[\033[0;34m\]\u@\h:\w \n\xE2\xA4\x87  \[\033[0m\]'

export GRADLE_HOME=/usr/local/Cellar/gradle/2.13
export JAVA_HOME=`/usr/libexec/java_home -v1.8`

export GOPATH=$HOME/dev/go
