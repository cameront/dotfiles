# Mostly taken from https://github.com/mathiasbynens/dotfiles

PATH=$HOME/bin:$PATH:/home/cameron/go/bin:/home/cameron/go_appengine/

for file in $HOME/.{path,bash_prompt,exports,aliases,functions,extra,gitcomplete}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

export EDITOR=emacs

# Bash history control
export HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
HISTSIZE=1000000
HISTFILESIZE=2000000

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
    source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null;
done;

# The next line updates PATH for the Google Cloud SDK.
source ~/google-cloud-sdk/path.bash.inc

# The next line enables bash completion for gcloud.
source ~/google-cloud-sdk/completion.bash.inc
