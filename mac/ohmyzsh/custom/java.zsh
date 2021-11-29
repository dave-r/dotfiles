#
# Set the version of java to use
# Parameters
#   $1 - The path to use as JAVA_HOME
#
function toJavaVersion {
	export JAVA_HOME=$1
	sed -i .BAK -e 's|^org.gradle.java.home=.*|org.gradle.java.home='$1'|' $HOME/.gradle/gradle.properties
}

alias gw="./gradlew"
alias j13="toJavaVersion $(/usr/libexec/java_home -v 13)"
alias j17="toJavaVersion $(/usr/libexec/java_home -v 17)"
alias graalvm="toJavaVersion $(/usr/libexec/java_home -v 11)"

# Use Java 17 by default
j17

export GRADLE_HOME=$(brew --prefix gradle)

export PATH=$PATH:$JAVA_HOME/bin
