# source .bashrc if it exists
[[ -s ~/.bashrc ]] && source ~/.bashrc

# source .dockerrc if it exists
[[ -s ~/.dockerrc ]] && source ~/.dockerrc

# add my home scripts dir to the path
PATH=~/scripts:$PATH