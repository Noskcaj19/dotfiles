#
# Dotfile vars
#

export DOTDIR="$HOME/.dotfiles"
export VIMDIR="$HOME/.dotfiles/vim"
export ZSHDIR="$HOME/.dotfiles/zsh"

#
# Editors
#

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'


#
# Less config
#

export LESS='-F -g -i -M -R -S -w -z-4'


#
# Path exports
#

export PATH="$HOME/.cargo/bin:$PATH"
export GOPATH="$HOME/Documents/Development/Go"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/usr/local/Google/flutter/bin"

#
# Secrets
#
#
source ~/.secret_envs
