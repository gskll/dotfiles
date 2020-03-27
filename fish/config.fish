set -g -x PATH /usr/local/bin $PATH

# Show/hide . files

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'

alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# General aliases

alias hy="history"
alias l="ls -1p"
alias ll="ls -rtlh"
alias la="ls -rtlha"
alias md="mkdir -p"
alias rd="rmdir"

alias cs="cd ~/cs/"
alias ,,="cd -"
alias ch="cd ~"
alias rm="trash"

alias fix_brew="sudo chown -R (whoami) /usr/local"

#Git aliases
alias gA="git add -A"
alias ga="git add"
alias gcm="git commit -m"
alias gc="git commit"
alias gs="git status"
alias gll="git log"
alias gl="git log --oneline"
alias gp="git push"
alias gpl="git pull"
alias go="git checkout"
alias gb="git branch"
alias gbo="git checkout -b"

# Source config.fish
alias sfc="source ~/.config/fish/config.fish"

set -g -x LC_ALL en_US.UTF-8

# Bash history
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

bind ! __history_previous_command
bind '$' __history_previous_command_arguments

# Setup pyenv/rbenv/goenv to work with fish
status --is-interactive
source (rbenv init - | psub)
source (pyenv init - | psub)
source (goenv init - | psub)

# Starship prompt https://starship.rs/
starship init fish | source

export PATH="$HOME/.rbenv/bin:$PATH"

export EDITOR="vim"

# CS50 C compile settings
export CC="gcc"
# export CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
# export LDLIBS="-lcs50 -lm"

set -gx LDFLAGS "-L/usr/local/opt/openblas/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openblas/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/openblas/lib/pkgconfig"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/andrew/cs/data-science/fast-ai/cs/google-cloud-sdk/path.fish.inc' ]; . '/Users/andrew/cs/data-science/fast-ai/cs/google-cloud-sdk/path.fish.inc'; end
