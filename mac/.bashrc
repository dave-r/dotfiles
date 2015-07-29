	# set some useful aliases
alias lsal='ls -al'
alias edit=subl

export PATH=$PATH:~/bin

# set up the prompt
export PS1=$'\[\033[0;34m\]\u@\h:\w \n\xE2\xA4\x87  \[\033[0m\]'

export GRADLE_HOME=/usr/local/Cellar/gradle/2.3
export JAVA_HOME=`/usr/libexec/java_home -v1.8`
# /Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home
export DOCKER_HOST=tcp://172.19.8.101:2375
