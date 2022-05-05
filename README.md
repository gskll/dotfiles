# Dotfiles

1. install homebrew
   `brew install vim tmux gcc fish ctags gpg n r rbenv pyenv goenv pandoc ruby sqlite starship tree zlib wget trash`

   `brew install --cask mongodb-compass firefox iterm2 flux google-chrome alfred rectangle 1password nordvpn notion vlc spotify visual-studio-code figma docker`

   `brew tap homebrew/cask-fonts`
   `brew install --cask font-meslo-lg-nerd-font font-sauce-code-pro-nerd-font`

2. install node `n latest`

## iTerm

set Appearance - Theme - Minimal
set VIM.json profile to default
set font to MesloLGSDZ Nerd Font Mono - size 16

### Set Fish as default shell

`echo /usr/local/bin/fish | sudo tee -a /etc/shells`
`chsh -s /usr/local/bin/fish`

## Fish

`ln -s ~/dotfiles/fish/ ~/.config/`

1. Install fisher -- https://github.com/jorgebucaran/fisher
2. Install z -- https://github.com/jethrokuan/z

## Vim

`ln -s ~/dotfiles/vim/ ~/`

1. Rename folder to `.vim`
2. Install vim-plug
3. PlugInstall

## Tmux

`echo ln -s "source ~/dotfiles/tmux/tmux.conf " > ~/.tmux.conf`
