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

alias ydl="youtube-dl"
alias fix_brew="sudo chown -R (whoami) /usr/local"

#alias gowsumeToolsRW="export $(/Applications/gowsumed.app/Contents/MacOS/gowsume use tools:sp-admin-rw)"

#Git aliases
alias gA="git add -A"
alias ga="git add"
alias gcm="git commit -m"
alias gc="git commit"
alias gs="git status"
alias gll="git log"
alias gl="git log --oneline"
alias glf="git log --oneline -n 5"
alias gp="git push"
alias gpl="git pull"
alias gco="git checkout"
alias gb="git branch"
alias gcob="git checkout -b"
alias gd="git diff"
alias sw="git switch"

# alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") brew"

alias vi="nvim"
alias vim="nvim"

# Source config.fish
alias sfc="source ~/.config/fish/config.fish"

set -gx LC_ALL en_US.UTF-8

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

export EDITOR="nvim"

source $HOME/.profile.fish # Load machine specific config
set -gx LDFLAGS "-L/usr/local/opt/zlib/lib"
set -gx CPPFLAGS "-I/usr/local/opt/zlib/include"
set -gx PKG_CONFIG_PATH "/usr/local/opt/zlib/lib/pkgconfig"
set -gx KEEP_BUILD_PATH true

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

source ~/.asdf/plugins/golang/set-env.fish
source /opt/homebrew/opt/asdf/libexec/asdf.fish
set -gx GOROOT (go env GOROOT)
set -gx GOPATH (asdf where golang)/packages
go env -w GOPATH=$GOPATH

# set -g -x PATH $GOPATH/bin /opt/homebrew/bin $PATH

# Starship prompt https://starship.rs/
starship init fish | source
