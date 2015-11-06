# source .bashrc if it exists
[[ -s ~/.bashrc ]] && source ~/.bashrc

# source .dockerrc if it exists
[[ -s ~/.dockerrc ]] && source ~/.dockerrc

# source .coreosrc if it exists
[[ -s ~/.coreosrc ]] && source ~/.coreosrc

# add my home scripts dir to the path
PATH=~/scripts:$PATH