#!/usr/bin/env zsh

CWD="${0:a:h}"

mkdir -p "$HOME/.git/"

ln -sf "$CWD/dir_colors" 	      "$HOME/.dir_colors"
ln -sf "$CWD/zshrc" 	 	      "$HOME/.zshrc"
ln -sf "$CWD/vimrc"		          "$HOME/.vimrc"
ln -sf "$CWD/git/commit-template" "$HOME/.git/commit-template"

git config --global commit.template "$HOME/.git/commit-template"
