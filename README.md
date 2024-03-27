# Dotfiles

1. [setup github ssh](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
1. download dotfiles `git@github.com:gskll/dotfiles.git`

1. install xcode-select `xcode-select --install`
1. install [homebrew](https://brew.sh/)
1. setup 1password - add plugins to firefox/chrome
1. install alfred3 from chrome - license key in 1password - https://cachefly.alfredapp.com/Alfred_3.8.6_972.dmg

1. brew install `brew bundle install --file ~/dotfiles/brew/Brewfile`
1. setup karabiner elements - import `dotfiles/karabiner-elements/karabiner.json`

1. set zsh to default `chsh -s $(which zsh)`
1. install [ohmyzsh](https://ohmyz.sh/#install)

   - `touch ~/.profile.zsh`
   - `ln -s ~/dotfiles/zsh/.zshrc ~`

1. setup tmux config

   - `ln -s ~/dotfiles/tmux/tmux.conf  ~/.tmux.conf`
   - `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
   - Enter tmux and hit `prefix + I` (`ctrl+a + I`) to install plugins

1. setup neovim

   - `ln -s ~/dotfiles/nvim/ ~/.config/`
   - open neovim and Lazy should run automatically

1. setup asdf
1. node
1. python
1. go

1. setup mac os defaults
   - `mkdir ~/Documents/screenshots && defaults write com.apple.screencapture location ~/Documents/screenshots`
