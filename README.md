# Dotfiles

1. setup github ssh
1. download dotfiles
1. run script
   1. install xcode-select
   1. install homebrew
   1. brew install
   1. setup starship
   1. set fish to default
   1. setup fish config
      1. include .profile.fish
      1. install fisher and plugins
   1. setup tmux config
      1. install tmux plugins
   1. setup neovim
      1. install plugins
   1. setup asdf
      1. node
      1. python
      1. go
1. setup mac os defaults
1. install alfred3 and dash5
1. install chrome plugins

brew packages to look at

- gh
- mackup
-

# old

1. `xcode-select --install`
1. install homebrew
   `brew install neovim tmux gcc fish ctags gpg r rbenv pyenv goenv pandoc ruby sqlite starship tree zlib wget trash ripgrep`

   `brew install --cask insomnia mongodb-compass firefox alacritty flux google-chrome alfred rectangle 1password nordvpn notion vlc spotify visual-studio-code figma docker caffeine dash kap loom whatsapp zoom the-unarchiver`

   `brew tap homebrew/cask-fonts`
   `brew install --cask  font-jetbrains-mono-nerd-font`

1. Setup 1password
1. install alfred3 from chrome - license key in 1password - https://cachefly.alfredapp.com/Alfred_3.8.6_972.dmg
1. install dash5 from chrome - license key in 1password - https://frankfurt.kapeli.com/downloads/v5/Dash.zip
1. install chrome plugins
   - 1password
   - react / redux / angular devtools
   - JSONVue
   - Loom

## Apple defaults

```
mkdir ~/Documents/screenshots && defaults write com.apple.screencapture location ~/Documents/screenshots

```

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
3. Install nvm -- https://github.com/jorgebucaran/nvm.fish

4. Install node version - `nvm install lts`
5. `set --universal nvm_default_version ` + version

## Vim (neovim)

`ln -s ~/dotfiles/nvim/ ~/.config`

1. Install packer
1. Run `PackerSync` in `packer.lua`

## Tmux

1. `ln -s ~/dotfiles/tmux/tmux.conf  ~/.tmux.conf`
2. `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
3. Enter tmux and hit `prefix + I` (`ctrl+a + I`) to install plugins
