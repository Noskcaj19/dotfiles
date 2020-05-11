function load_PZT_mod() {
	zinit ice svn silent; zinit snippet PZT::modules/$1
}

function load_PZT_mod_async() {
	zinit ice svn silent; zinit ice wait"0"; zinit snippet PZT::modules/$1
}

declare -A ZINIT 
ZINIT[HOME_DIR]="$ZSHDIR/zplugins"
# Load zinit
source "$ZSHDIR/external/zinit/zinit.zsh"

# Pure prompt
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

# zinit light denysdovhan/spaceship-prompt
# zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

zstyle :prompt:pure:git:dirty color 242


# Zprezto config (todo: move to file)
# Must be set prior to module loading
zstyle ':prezto:*:*' case-sensitive 'no'
zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:module:editor' key-bindings 'emacs'
zstyle ':prezto:module:editor' dot-expansion 'yes'
zstyle ':prezto:module:gnu-utility' prefix 'g'
zstyle ':prezto:module:syntax-highlighting' pattern \
	'rm -rf*' 'fg=white,bold,bg=red'

# Zprezto modules
load_PZT_mod environment
load_PZT_mod terminal
load_PZT_mod editor
load_PZT_mod history
load_PZT_mod directory
load_PZT_mod spectrum
load_PZT_mod utility
load_PZT_mod completion
load_PZT_mod fasd
load_PZT_mod git
load_PZT_mod osx
load_PZT_mod python
# Prints an error, but loads fine?
load_PZT_mod archive &>/dev/null
# silent is apparently not so silent
load_PZT_mod_async homebrew &>/dev/null


zinit light zsh-users/zsh-history-substring-search 


# Load syntax highlighting with async power
zinit ice wait"0" atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay" lucid
zinit light zdharma/fast-syntax-highlighting


zinit light unixorn/git-extra-commands
zinit light djui/alias-tips
zinit light $ZSHDIR/contrib/dotenv

# load iterm tools
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# load gcp tools
for inc (/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/{completion,path}.zsh.inc) test -e $inc && source $inc

# load personal configs
for config ($HOME/.dotfiles/zsh/configs/*.zsh) source $config


# load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
