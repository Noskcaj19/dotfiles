function z-jump-widget() {
    zle vi-beginning-of-line
    BUFFER="zi ${BUFFER}"
    zle accept-line
}
zle -N z-jump-widget

bindkey '^Z' z-jump-widget
