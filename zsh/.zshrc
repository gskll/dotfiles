# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"

plugins=(git dotenv z asdf zsh-autosuggestions zsh-syntax-highlighting)

. ~/.asdf/plugins/golang/set-env.zsh

source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8

source $HOME/.profile.zsh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias vi="nvim"
alias vim="nvim"
alias zshconfig="nvim ~/dotfiles/zsh/.zshrc"
alias sourceconfig="source ~/dotfiles/zsh/.zshrc"
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

alias l="ls -1p"
alias ll="ls -rtlh"
alias la="ls -rtlha"

alias ,,="cd -"
alias ch="cd ~"
alias rm="trash"

alias fix_brew="sudo chown -R (whoami) /usr/local"

alias gA="git add -A"
alias ga="git add"
alias gcm="git commit -m"
alias gc="git commit"
alias gs="git status"
alias gll="git log"
alias gl="git --no-pager log --oneline"
alias glf="git --no-pager log --oneline -n 5"
alias gp="git push"
alias gpl="git pull"
alias gco="git checkout"
alias gb="git --no-pager branch"
alias gcob="git checkout -b"
alias gd="git diff"
alias sw="git switch"
alias gup="git push -u origin HEAD"

eval "$(starship init zsh)"
