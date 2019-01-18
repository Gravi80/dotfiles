# dotfiles
A set of vim, zsh, git, and psql configuration files.

brew cask install iterm2

ZSH 
----
brew install zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting
```
vi ~/.zshrc
	source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
	export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
	source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
``` 
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh


https://github.com/zsh-users
