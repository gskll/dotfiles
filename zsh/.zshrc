# zmodload zsh/zprof
#################
## BASIC SETUP ##
#################

typeset -U PATH
autoload colors; colors
export LANG=en_US.UTF-8

local private="${HOME}/.profile.zsh"
if [ -e ${private} ]; then
  . ${private}
fi

local CONFIG="$HOME/dotfiles/zsh"
fpath=($CONFIG/functions $fpath)
autoload chpwd switch_color_scheme chatgippity

#################
#### HISTORY ####
#################

HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt INC_APPEND_HISTORY     # Immediately append to history file.
setopt EXTENDED_HISTORY       # Record timestamp in history.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS       # Dont record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
setopt HIST_IGNORE_SPACE      # Dont record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS      # Dont write duplicate entries in the history file.
setopt SHARE_HISTORY          # Share history between all sessions.
unsetopt HIST_VERIFY          # Execute commands using history (e.g.: using !$) immediately

#################
## COMPLETION ###
#################
#
# Add completions installed through Homebrew packages
# See: https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null; then
  FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi

# Speed up completion init, see: https://gist.github.com/ctechols/ca1035271ad134841284
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# unsetopt menucomplete
unsetopt flowcontrol
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt auto_pushd

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

#################
# KEY BINDINGS ##
#################

# Vim Keybindings
bindkey -v

# Open line in Vim by pressing 'v' in Command-Mode
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# CTRL-R to search through history
bindkey '^R' history-incremental-search-backward
# CTRL-S to search forward in history
bindkey '^S' history-incremental-search-forward
# Accept the presented search result
bindkey '^Y' accept-search

# Use the arrow keys to search forward/backward through the history,
# using the first word of what's typed in as search word
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Use the same keys as bash for history forward/backward: Ctrl+N/Ctrl+P
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# Backspace working the way it should
bindkey '^?' backward-delete-char
bindkey '^[[3~' delete-char

# Some emacs keybindings won't hurt nobody
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# Where should I put you?
bindkey -s '^F' "tmux-sessionizer\n"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

#################
### FUNCTIONS ###
#################

local CONFIG="$HOME/dotfiles/zsh"
fpath=($CONFIG/functions $fpath)
autoload chpwd switch_color_scheme

#################
#### PLUGINS ####
#################

. /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

. ~/dotfiles/zsh/zsh-z/zsh-z.plugin.zsh

. /opt/homebrew/opt/asdf/libexec/asdf.sh
. ~/.asdf/plugins/golang/set-env.zsh

#################
#### ALIASES ####
#################

local myaliases="${HOME}/dotfiles/zsh/aliases"
if [ -e ${myaliases} ]; then
  . ${myaliases}
fi

##################
##### PROMPT #####
##################

setopt prompt_subst

git_prompt_info() {
  local dirstatus=""
  local dirty="%{$fg[red]%} ±%{$reset_color%}"

  if [[ ! -z $(git status --porcelain 2> /dev/null | tail -n1) ]]; then
    dirstatus=$dirty
  fi

  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo " %{$fg_bold[magenta]%}${ref#refs/heads/}$dirstatus%{$reset_color%}"
}

local dir_info="%{$fg[cyan]%}%(5~|%-1~/.../%2~|%4~)%{$reset_color%}"
local promptnormal="%{$fg_bold[green]%}%(!.*→.→) %{$reset_color%}"
local promptjobs="%{$fg_bold[yellow]%}%(!.*→.→) %{$reset_color%}"

PROMPT='${dir_info}$(git_prompt_info) %(1j.$promptjobs.$promptnormal)'

# zprof
