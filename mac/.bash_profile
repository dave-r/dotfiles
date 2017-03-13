# source .bashrc if it exists
[[ -s ~/.bashrc ]] && source ~/.bashrc

# source .dockerrc if it exists
[[ -s ~/.dockerrc ]] && source ~/.dockerrc

# source .coreosrc if it exists
[[ -s ~/.coreosrc ]] && source ~/.coreosrc

# source .gorc if it exists
[[ -s ~/.gorc ]] && source ~/.gorc

# add my home scripts dir to the path
PATH=~/scripts:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dave/gcloud/google-cloud-sdk/path.bash.inc' ]; then source '/Users/dave/gcloud/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dave/gcloud/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/dave/gcloud/google-cloud-sdk/completion.bash.inc'; fi
