if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zmodload zsh/zprof
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

function load_PZT_mod() {
    zinit ice svn silent; zinit snippet PZT::modules/$1
}

zinit ice depth=1; zinit light romkatv/powerlevel10k

# Zprezto config (todo: move to file)
# Must be set prior to module loading
zstyle :prompt:pure:git:dirty color 242
zstyle ':prezto:*:*' case-sensitive 'no'
zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:module:editor' key-bindings 'emacs'
zstyle ':prezto:module:editor' dot-expansion 'yes'
zstyle ':prezto:module:gnu-utility' prefix ''
zstyle ':prezto:module:syntax-highlighting' pattern \
    'rm -rf*' 'fg=white,bold,bg=red'

load_PZT_mod environment
load_PZT_mod terminal
load_PZT_mod editor
load_PZT_mod history
load_PZT_mod directory
load_PZT_mod spectrum
load_PZT_mod gnu-utility
load_PZT_mod utility
load_PZT_mod completion
load_PZT_mod fasd
load_PZT_mod git
if [[ $(uname) == 'Darwin' ]] {
  load_PZT_mod osx
}
load_PZT_mod python
load_PZT_mod archive
if [[ $(uname) == 'Darwin' ]] {
  zinit ice svn wait lucid; zinit snippet PZT::modules/homebrew
}
zinit ice svn wait lucid; zinit snippet OMZ::plugins/dotenv
# load_PZT_mod homebrew

# FZF Tab
zinit ice wait lucid; zinit light Aloxaf/fzf-tab
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
#zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
#zstyle ':fzf-tab:complete:ls:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

# History substring search (filter history by pressing up arrow)
zinit ice wait lucid; zinit light zsh-users/zsh-history-substring-search

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions


zinit wait lucid for \
	unixorn/git-extra-commands \
	djui/alias-tips \
	$ZSHDIR/contrib/dotenv \
	chisui/zsh-nix-shell
	# wfxr/forgit

# Fixes weird issue with fzf-tab
zstyle -d ':completion:*' format
zstyle ':completion:*:descriptions' format '[%d]'

# load iterm tools
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# load personal configs
for config ($HOME/.dotfiles/zsh/configs/*.zsh) source $config

# Load p10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zprof

### End of Zinit's installer chunk
