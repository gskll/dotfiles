# Dotfiles

1. `xcode-select --install`
1. install homebrew
   `brew install neovim tmux gcc fish ctags gpg r rbenv pyenv goenv pandoc ruby sqlite starship tree zlib wget trash ripgrep`

   `brew install --cask insomnia mongodb-compass firefox iterm2 flux google-chrome alfred rectangle 1password nordvpn notion vlc spotify visual-studio-code figma docker caffeine dash kap loom whatsapp zoom the-unarchiver`

   `brew tap homebrew/cask-fonts`
   `brew install --cask font-meslo-lg-nerd-font font-sauce-code-pro-nerd-font`

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
