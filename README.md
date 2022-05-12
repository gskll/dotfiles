# Dotfiles

1. install homebrew
   `brew install vim tmux gcc fish ctags gpg r rbenv pyenv goenv pandoc ruby sqlite starship tree zlib wget trash`

   `brew install --cask insomnia mongodb-compass firefox iterm2 flux google-chrome alfred rectangle 1password nordvpn notion vlc spotify visual-studio-code figma docker caffeine dash kap loom whatsapp zoom the-unarchiver`

   `brew tap homebrew/cask-fonts`
   `brew install --cask font-meslo-lg-nerd-font font-sauce-code-pro-nerd-font`

1. Setup 1password
2. install alfred3 from chrome - license key in 1password - https://cachefly.alfredapp.com/Alfred_3.8.6_972.dmg
3. install dash5 from chrome - license key in 1password - https://frankfurt.kapeli.com/downloads/v5/Dash.zip
4. install chrome plugins
    - 1password
    - react / redux / angular devtools
    - JSONVue
    - Loom

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

## Vim

`ln -s ~/dotfiles/vim/ ~/`

1. Rename folder to `.vim`
2. Install vim-plug
3. PlugInstall

## Tmux


1. `ln -s ~/dotfiles/tmux/tmux.conf  ~/.tmux.conf`
2. `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
3. Enter tmux and hit `prefix + I` (`ctrl+a + I`) to install plugins

