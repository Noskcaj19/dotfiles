# Vim
alias vim="nvim"

# Breaks `cd -<tab>`
# alias cd="z"

# ls shortcuts
alias ls="exa"
alias lt1="exa -TL1"
alias lt2="exa -TL2"
alias lt3="exa -TL3"

# Override zsh aliases
unalias l ll lr la lm lx lk lt lc lu >/dev/null 2>/dev/null

alias l="exa -1a"
alias ll="exa -l"
alias la="exa -la"
alias laa="exa -a"
alias lk="exa -s size"

# Cargo shortcuts
alias car="cargo run"
alias cab="cargo build"
alias cac="cargo check"
alias cax="cargo xtask"
alias cxc="cargo xtask check"


if [[ $(uname) == 'Darwin' ]] {
    # Clip alias
    alias -g clip='$(pbpaste)'

    # Iterm cd tab
    alias cdt="osascript -l JavaScript ~/.files/automation/cd-tab.applescript"

    function mdfindg() {
        mdfind "kMDItemDisplayName=='$1'$2"
    }

    alias sleepoff='sudo pmset -b sleep 0; sudo pmset -b disablesleep 1'
    alias sleepon='sudo pmset -b sleep 5; sudo pmset -b disablesleep 0'
}

alias parrot="curl parrot.live"

if (( $+commands[caddy] )) {
    unalias http-serve
    alias http-serve='caddy file-server -browse -listen localhost:8080'    
}

