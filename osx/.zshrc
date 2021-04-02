
#
#
# NVM
#
#

export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

#
#
# GIT PROMPT
#
#

# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '- ('$branch')'
  fi
}
# Enable substitution in the prompt.
setopt prompt_subst
# Config for prompt. PS1 synonym.
prompt='%2/ $(git_branch_name) > '

#
#
# ALIASES
#
#

alias cdc="pushd ~/code/convoyinc"
alias pj="python -mjson.tool"

#
#
# PATH
#
#

# node modules
export PATH=./node_modules/.bin:$PATH
# convoy ops
export PATH=/Users/$USER/code/convoyinc/ops/.tools:$PATH

#
#
# ENV VARS
#
#

export AWS_SDK_LOAD_CONFIG=true
export VAULT_CAPATH=/Users/$USER/code/convoyinc/ops/credentials/convoy-vault-ca.cert.pem
export VAULT_ADDR=https://10.10.27.22:8200
