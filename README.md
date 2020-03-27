# Dotfiles

## iTerm
set VIM.json profile to default
1. install homebrew
`brew install vim tmux gcc fish ctags gzg n r rbenv pyenv pandoc ruby sqlite starship tree zlib wget`

## Fish
`ln -s ~/dotfiles/fish/ ~/.config/fish/`

## Vim
`ln -s ~/dotfiles/vim/snippets/ ~/.vim/`
`ln -s ~/dotfiles/vim/vimrc ~/.vim/`

1. Intall vim-plug
2. Plug-install

## Tmux
`echo n -s "source ~/dotfiles/tmux/tmux.conf
" > ~/.tmux.conf`
