# set some useful aliases
alias lsal='ls -al'
alias edit=subl
alias idea='open /Applications/IntelliJ\ IDEA\ CE.app/'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export PATH=$PATH:~/bin:/usr/local/opt/go/libexec/bin

# set up the prompt
source $HOME/.git-completion.bash
source $HOME/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
# export PS1=$'\[\033[0;34m\]\u@\h:\w \n\xE2\xA4\x87  \[\033[0m\]'
export PS1=$'\[\033[0;34m\]\u@\h:\w\[\033[0;33m\]$(__git_ps1)\n\[\033[0;32m\]\xE2\xA4\x87  \[\033[0m\]'

export GRADLE_HOME=/usr/local/Cellar/gradle/3.1
export JAVA_HOME=`/usr/libexec/java_home -v1.8`

export GOPATH=$HOME/dev/go

export PATH="$PATH:$HOME/.rvm/bin:$HOME/android-sdk/platform-tools" # Add RVM to PATH for scripting
