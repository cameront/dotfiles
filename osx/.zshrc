#
#
# ZSH
#
#

HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
HISTFILESIZE=9999999
SAVEHIST=$HISTSIZE
setopt APPEND_HISTORY            # Append to history
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
#setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
#setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
#setopt HIST_BEEP                 # Beep when accessing nonexistent history.

export EDITOR=emacs

alias pj="python3 -mjson.tool"

#
# git prompt
#

autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
precmd() {
    vcs_info
}

zstyle ':vcs_info:git*' formats "on %b %a %m%u%c "
setopt prompt_subst
PROMPT_NEWLINE=$'\n'
PROMPT='%F{166}%*%f in %F{green}%~%f %F{33}${vcs_info_msg_0_}%f ${PROMPT_NEWLINE}\$ '

#
# NVM
#

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#
# ALIASES
#

alias cdc="pushd ~/code"

#
# PATH
#

# node modules
export PATH=./node_modules/.bin:$PATH

# golang
export PATH=$(go env GOPATH)/bin:$PATH

#
# ENV VARS
#

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
