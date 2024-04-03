DOTFILES := $(shell pwd)

git:
	ln -sf $(DOTFILES)/git/gitconfig $(HOME)/.gitconfig
	ln -sf $(DOTFILES)/git/githelpers $(HOME)/.githelpers
	ln -sf $(DOTFILES)/git/gitignore $(HOME)/.gitignore
.PHONY: git

zsh:
	ln -sf $(DOTFILES)/zsh/zshrc $(HOME)/.zshrc
.PHONY: zsh

tmux:
	ln -sf $(DOTFILES)/tmux/tmux.conf $(HOME)/.tmux.conf
	mkdir -p $(HOME)/bin
	ln -sf $(DOTFILES)/tmux/tmux-sessionizer $(HOME)/bin/tmux-sessionizer
	chmod +x $(HOME)/bin/tmux-sessionizer
.PHONY: tmux

neovim:
	mkdir -p $(HOME)/.config
	ln -sf $(DOTFILES)/nvim $(HOME)/.config
.PHONY: neovim

alacritty:
	mkdir -p $(HOME)/.config
	ln -sf $(DOTFILES)/alacritty $(HOME)/.config
.PHONY: alacritty

all: git zsh tmux neovim alacritty
